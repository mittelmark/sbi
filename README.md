# sbi - package

[![Release](https://img.shields.io/github/v/release/mittelmark/sbi.svg?label=current+release)](https://github.com/mittelmark/sbi/releases)
[![license](https://img.shields.io/badge/license-MIT-lightgray.svg)](https://opensource.org/license/MIT)
<!-- [![CI test](https://github.com/mittelmark/sbi/workflows/R/badge.svg)](https://github.com/mittelmark/sbi/actions) -->
![Commits](https://img.shields.io/github/commits-since/mittelmark/sbi/latest)
![Downloads](https://img.shields.io/github/downloads/mittelmark/sbir/total)
[![Vignette](https://img.shields.io/badge/Vignette-blue)](https://github.com/mittelmark/sbi/releases/latest/download/sbi-examples.pdf)

## Name

__sbi__ - R functions for the course "Statistical Bioinformatics" and the
Summer school of the University of Potsdam ["Statistics for Human Biology and Public Health"](https://www.human-biology-and-public-health.org/index.php/hbph/summerschool).

## Synopsis

```r
library(sbi)        ### load the library into your session
ls(sbi)             ### what methods are available
library(help="sbi") ### lookup the package help
```

## Description

Package  with  functions  for the  course  Statistical  Bioinformatics  at the
University  of Potsdam.  The course  takes place as a mandatory course for the
[Master Bioinformatics program](https://www.uni-potsdam.de/de/studium/studienangebot/masterstudium/master-a-z/bioinformatics-master)
every Winter  semester. There are as well some functions  added which are used
in the  Summer school
[Human  Biology and Public  Health](https://www.human-biology-and-public-health.org/index.php/hbph/summerschool) of the  University  of
Potsdam.

## Installation

The  package  comes as a single  file R script.  You can  either  just  source
the latest version of that script directly from Github like this:

```
$ R    # start R from a terminal or via start menu
> source("https://raw.githubusercontent.com/mittelmark/sbi/refs/heads/main/sbi-src.R")
> ls(sbi)  ## list all methods
> vignette("sbi-examples")  ## load the vignette
```

Or you install the latest release as a normal package:

```
$ R
> install.packages("https://github.com/mittelmark/sbi/releases/download/v0.4.2/sbi_0.4.2.tar.gz",repos=NULL)
> library(sbi)
> ls(sbi)
> vignette("sbi-examples")
```

Or you install the latest release from a Unix Terminal like this:

```
wget https://github.com/mittelmark/sbi/releases/download/v0.4.2/sbi_0.4.2.tar.gz
R CMD INSTALL --library=~/R sbi_0.4.2.tar.gz
```

Installation as a package has the advantage  that you have the  documentation
and the package vignette available as usually for R packages.

Or you can install the latest development version directly from Github like this:

- fetch the package code from github
- extract  all  individual  files from the master  file  _sbi-src.R_  into the
  package structure 
- build the package
- check the package
- install the package

Here the commands:

```bash  
wget -O sbi-src.R https://github.com/mittelmark/sbi/raw/main/sbi-src.R
Rscript sbi-src.R --process    sbi-src.R         # extract all files
Rscript sbi-src.R --vignettex  sbi-src.R         # extract examples as vignette
Rscript sbi-src.R --build      sbi               # build package tar-gz file
Rscript sbi-src.R --check      sbi_0.4.2.tar.gz  # check package tar-gz file
Rscript sbi-src.R --install    sbi_0.4.2.tar.gz  # install from local tar-gz file
```


## Background

The   single   file  R   package   approach   is   described   in  the
[rsfp project](https://github.com/mittelmark/rsfp).

## Changes

- 2026-01-17: version 0.4.2 - [package](https://github.com/mittelmark/sbi/releases/download/v0.4.2/sbi_0.4.2.tar.gz) - [vignette](https://github.com/mittelmark/sbi/releases/download/v0.4.2/sbi-examples.pdf)
   - adding doc, ellipse and cylinder shape to flow charts and shape function
   - adding fstart, fnext, fend shapes for process charts
- 2025-10-15: version 0.4.1
   - fix for kroki service not working by using local installs of
     GraphViz dot, plantuml and ditaa first before using kroki
   - fix for background color in vignette in code sections
- 2025-10-09: version 0.4.0
   - new function KL divergence sbi_kl
- 2025-09-23: version 0.3.0
   - new function sbi_error_plot
   - new function sbi_mtex to display LaTeX equations
- 2025-09-18: version 0.2.1
   - fix main.cex to cex.main in vignette
- 2025-09-17: Version 0.2.0
   - new commands nfig, rfig, ntab, rtab for figure and 
     table numbering and referencing
   - new command mtex for create LaTeX equations as png documents
   - switching from extrafont in vignette to showtext
   - adding timetable functions tt_plot and tt_item
- 2025-09-01: Version 0.1.2
   - fixing issue with girls / boys order in ref_table
- 2025-07-12:
   - adding cdc references for weight
- 2025-07-10: Version 0.1.0
   - adding methods qr_plot and randomize
   - adding new MUAC references from Ado et. al. 2017
- 2024-08-28: Version 0.0.1 - Initial Release
## Authors

- Detlef Groth, University of Potsdam (Author and Maintainer)
- Laura Schander, University of Potsdam (Contributor)

## License

MIT License see file [LICENSE](LICENSE).
