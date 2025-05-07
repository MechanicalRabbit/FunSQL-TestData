# FunSQL-TestData.jl

*FunSQL-TestDATA is a set of disparately licensed data sets used for testing FunSQL.*

[mimic-iv-full]: https://physionet.org/content/mimiciv/
[mimic-iv-demo]: https://physionet.org/content/mimic-iv-demo/
[odbl-1.0]: https://physionet.org/content/mimic-iv-demo/view-license/2.2/
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
under the copyleft [Open Data Commons Open Database License v1.0][odbl-1.0].

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

The following Julia program shuld then work.

```julia
using Pkg, Pkg.Artifacts
Pkg.instantiate() # download Artifacts.toml

using DuckDB
conn = DuckDB.DB()
mimic_dbfile = joinpath(artifact"mimic-iv-demo", "mimic-iv-demo-2.2.duckdb")
DuckDB.execute(conn, "ATTACH '$(mimic_dbfile)' AS mimic (READ_ONLY);")
DuckDB.execute(conn, "SELECT count(*) FROM mimic.patients")
```
