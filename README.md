# FunSQL-TestData.jl

*FunSQL-TestDATA is a set of disparately licensed data sets used for testing FunSQL.*

[mimic-iv-full]: https://physionet.org/content/mimiciv/
[mimic-iv-demo]: https://physionet.org/content/mimic-iv-demo/
[mimic-license]: https://physionet.org/content/mimic-iv-demo/view-license/2.2/
[eicu-crd-full]: https://physionet.org/content/eicu-crd/
[eicu-crd-demo]: https://physionet.org/content/eicu-crd-demo/
[eicu-crd-open]: https://physionet.org/content/eicu-crd-demo/view-license/2.0.1/
[physionet]: https://physionet.org/content/?topic=MIMIC+IV
[funsql]: https://github.com/MechanicalRabbit/FunSQL.jl
[artifact]: https://pkgdocs.julialang.org/v1/artifacts/
[julia]: https://julialang.org/
[mimic]: https://mimic.mit.edu/
[citi]:  https://physionet.org/about/citi-course/
[cred]: https://physionet.org/credential-application/
[pchdl]: https://physionet.org/content/mimiciv/view-license/3.1/

These data are used demonstrate, document, and test the [FunSQL][funsql]
ecosystem. They are packaged exactly with a `tar.gz` release that is
used via [Julia][julia]'s [Pkg Artifact][artifact]. Each dataset is
licensed individually.

### MIMIC-IV Clinical Database Demo

This is a [100 person demostration sample][mimic-iv-demo] from the [Medical
Information Mart for Intensive Care][mimic] (MIMIC)-IV database as prepared
from Boston's Beth Israel Deaconess Medical Center electronic health
records, released though [PhysioNet][physionet] collaborative repository
under the copyleft [Open Data Commons Open Database License v1.0][mimic-license].

The [full MIMIC IV][mimic-iv-full] dataset is available upon completing
[CITI Program][citi] "Massachusetts Institute of Technology Affilates" training
and executing the PhysioNet [Credentialed Health Data License][pchdl].
PhysioNet credentialing is available to independent researchers.

To use the 100 person demo in Julia, you'll first need this in your
`Artifacts.toml`.

```toml
[mimic-iv-demo]
git-tree-sha1 = "e9227b6756a382f42ab91cfb5ea8fda781c7b95e"

    [[mimic-iv-demo.download]]
    url = "https://github.com/MechanicalRabbit/FunSQL-TestData/releases/download/20250504/mimic-iv-demo-2.2.duckdb.tgz"
    sha256 = "e534b45b0d5c48dbe17594b8b74f72a4f5f04cb65c1b283c19247f2792e98c94"
```

The following Julia program should then work.

```julia
using Pkg, Pkg.Artifacts
Pkg.instantiate() # download Artifacts.toml

using DuckDB
conn = DuckDB.DB()
mimic_dbfile = joinpath(artifact"mimic-iv-demo", "mimic-iv-demo-2.2.duckdb")
DuckDB.execute(conn, "ATTACH '$(mimic_dbfile)' AS mimic (READ_ONLY);")
DuckDB.execute(conn, "SELECT count(*) FROM mimic.patients")
```

### eICU Collaborative Research Database Demo

This is a [~2500 ICU stay demonstration sample][eicu-crd-demo] from the
[eICU Collaborative Research Database][eicu-crd] (eICU-CRD) database, a
multi-center database comprised of deidentified health data for over
200,000 admissions to ICUs across the United States between 2014-2015.
This is released though [PhysioNet][physionet] collaborative repository
under the copyleft [Open Data Commons Open Database License v1.0][eicu-crd-open].

The [full eICU-CRD][eicu-crd-full] dataset is available upon completing
[CITI Program][citi] "Massachusetts Institute of Technology Affilates" training
and executing the PhysioNet [Credentialed Health Data License][pchdl].
PhysioNet credentialing is available to independent researchers.

To use this demo in Julia, you'll first need this in your
`Artifacts.toml`.

```toml
[eicu-crd-demo]
git-tree-sha1 = "006da6f242eb440ffec3b706bd3edd06ea9831d0"

    [[eicu-crd-demo.download]]
    url = "https://github.com/MechanicalRabbit/FunSQL-TestData/releases/download/20250514/eicu-crd-demo-2.0.1.duckdb.tgz"
    sha256 = "0e8752f71ac6d802fee5d08809e824fa69c23057dad796c9aec05bcdc6108608"
```

The following Julia program should then work.

```julia
using Pkg, Pkg.Artifacts
Pkg.instantiate() # download Artifacts.toml

using DuckDB
conn = DuckDB.DB()
eicu_dbfile = joinpath(artifact"eicu-crd-demo", "eicu-crd-demo-2.0.1.duckdb")
DuckDB.execute(conn, "ATTACH '$(eicu_dbfile)' AS eicu (READ_ONLY);")
DuckDB.execute(conn, "SELECT count(), count(distinct uniquepid) FROM eicu.patient")
```
