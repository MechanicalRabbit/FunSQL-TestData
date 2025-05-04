using Downloads
using ZipFile
using DuckDB
using CodecZlib
using DBInterface
using Logging

const DEMOZIP = "https://physionet.org/static/published-projects/mimic-iv-demo/mimic-iv-clinical-database-demo-2.2.zip"
const BUILDDIR = joinpath(tempdir(), "mimic-iv-build")

function download_demo()
    mkpath(BUILDDIR)
    @info "Using directory: $BUILDDIR"
    zip_path = joinpath(BUILDDIR, "mimic-iv-demo.zip")
    if !isfile(zip_path)
        @info "Downloading ZIP file..."
        Downloads.download(DEMOZIP, zip_path)
        @info "Download complete!"
    else
        @info "ZIP file already exists, skipping download."
    end
    return zip_path
end

function execute_file(con::DuckDB.DB, filename::String)
    sql = read(joinpath(@__DIR__, filename), String)
    # remove lines that start with --
    sql = join(filter(line -> !startswith(strip(line), "--"), split(sql, '\n')), "\n")
    # split into statements on semicolon at end of line
    stmts = split(sql, r";\s*\n"; keepempty=false)
    for stmt in stmts
        stmt = strip(stmt)
        if !isempty(stmt)
            DuckDB.execute(con, stmt)
        end
    end
end

function import_to_duckdb(zip_path::String)
    build_dir = dirname(abspath(zip_path))
    db_path = joinpath(build_dir, replace(basename(zip_path), r"\.zip$" => ".duckdb"))
    isfile(db_path) && rm(db_path)
    @info "Creating DuckDB database at: $db_path"
    con = DuckDB.DB(db_path)
    execute_file(con, "create_tables.sql")
    @info "Extracting and importing files..."
    r = ZipFile.Reader(zip_path)
    zip_base = replace(basename(zip_path), r"\.zip$" => "")
    try
        for f in r.files
            if !endswith(f.name, ".csv.gz")
                continue
            end
            table_name = replace(basename(f.name), r"\.csv\.gz$" => "")
            @info "Importing: $table_name"
            temp_gz = joinpath(build_dir, "$(zip_base)__$(basename(f.name))")
            open(temp_gz, "w") do io
                write(io, read(f))
            end

            # Insert into pre-existing table
            DuckDB.execute(con, """
                INSERT INTO $(table_name)
                SELECT * FROM read_csv_auto('$(temp_gz)', 
                    compression='gzip',
                    ignore_errors=false,
                    escape='"',
                    quote='"',
                    strict_mode=true)
            """)
            rm(temp_gz)
        end
    finally
        close(r)
    end
    @info "Import complete. Database saved at: $db_path"
    return con
end

@info "Starting MIMIC-IV database creation..."
if length(ARGS) > 0
    zip_path = ARGS[1]
    if !isfile(zip_path)
        error("ZIP file not found: $(zip_path)")
    end
else
    zip_path = download_demo()
end
con = import_to_duckdb(zip_path)
@info "DuckDB database created at: $(con.handle.file)"
