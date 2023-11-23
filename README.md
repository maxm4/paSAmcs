# paSAmcs

Minimal Cut Sets (MCSs) analysis of a consortium of *P. aeruginosa* and *S. aureus*.


## Description :

This repository uses *[aspefm](https://github.com/maxm4/aspefm)* to compute Minimal Cut Sets using Answer Set Programming (ASP).

The module *[mparser](https://github.com/maxm4/mparser)* should be used for converting metabolic networks into ASP rules.

The repository contains our context-specific models used for the construction of the consortium.

The models in *models* and their compressed counterparts are adapted from the *iPae1146* and *iYS854* genome-scale models.

The repository also contains code for benchmarking our *aspefm* tool against *CNApy* and *CoBAMP*.

Example executions of the tools are found in the *scripts* folder.

Conversion of MCSs into enzyme targets using GPRs and ASP is described in the *models/gpr* folder.

And outputs used in our analysis of the consortium of *P. aeruginosa* and *S. aureus* are provided in *outputs*.

The latter include the protein structures and alignments of our retrieved consortium-level targets.

Further code for computing our study's figures and in particular for the analysis concerning the enzyme targets' protein structures is not provided here but is available on request.

## Required :

### Python version :

The code requires Python version 3.

Requirements are detailed in *requirements.txt*.

### *aspefm* :

clingo version 5.4.0, compilation of clingo with Python is mandatory

	conda install -c potassco clingo

IBM cplex version 12.1.0 or above.

## Installing with submodules :

*aspefm* and *mparser* are submodules of this repository.

Please refer to their respective documentation.

The full repository and its submodules can be downloaded/cloned using:

```git clone --recurse-submodules https://github.com/maxm4/paSAmcs ```

See more information: [https://git-scm.com/book/en/v2/Git-Tools-Submodules](https://git-scm.com/book/en/v2/Git-Tools-Submodules)

### Unzipping the 3-part zip :

``` zip -F aspefm_consortium_size_16_1.5_days.zip --out aspefm_output.zip ```

``` unzip aspefm_output.zip ```

The `zip` and `unzip` utilies are pre-installed in any Linux distribution.

## References :

*iPae1146* was published in the following paper: [Bartell, J. A. et al. Reconstruction of the metabolic network of Pseudomonas aeruginosa to interrogate virulence factor synthesis. Nature Communications 8, 14631 (2017).](https://doi.org/10.1038/ncomms14631)

*iYS854* was published in the following paper: [Seif, Y. et al. Genome-scale metabolic reconstructions of multiple Salmonella strains reveal serovar-specific metabolic traits. Nat Commun 9, 3771 (2018).](https://doi.org/10.1038/s41467-018-06112-5)

*CNApy* was published in the following paper: [Thiele, S., von Kamp, A., Bekiaris, P. S., Schneider, P. & Klamt, S. CNApy: a CellNetAnalyzer GUI in Python for Analyzing and Designing Metabolic Networks. Bioinformatics (2021)](https://doi.org/10.1093/bioinformatics/btab828)

*CoBAMP* was published in the following paper: [Vieira, V. & Rocha, M. CoBAMP: a Python framework for metabolic pathway analysis in constraint-based models. Bioinformatics 35, 5361–5362 (2019).](https://doi.org/10.1093/bioinformatics/btz598)

*aspefm* was published in the following paper: [Mahout, M., Carlson, R. P. and Peres, S. Answer Set Programming for Computing Constraints-Based Elementary Flux Modes: Application to Escherichia coli Core Metabolism. Processes 8, 1649 (2020)](https://doi.org/10.3390/pr8121649).

## Contact :

Please contact Maxime Mahout if you have any questions about the repository's content.


