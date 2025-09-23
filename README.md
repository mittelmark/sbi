# sbi - package

[![Release](https://img.shields.io/github/v/release/mittelmark/sbi.svg?label=current+release)](https://github.com/mittelmark/sbi/releases)
[![license](https://img.shields.io/badge/license-MIT-lightgray.svg)](https://opensource.org/license/MIT)
[![CI test](https://github.com/mittelmark/sbi/workflows/R/badge.svg)](https://github.com/mittelmark/sbi/actions)
![Commits](https://img.shields.io/github/commits-since/mittelmark/sbi/latest)

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
> ls(sbi) 
```

Or you install the latest release as a normal package:

```
$ R
> install.packages("https://github.com/mittelmark/sbi/releases/download/v0.3.0/sbi_0.3.0.tar.gz",repos=NULL)
> library(sbi)
> ls(sbi)
```

Or you install the latest release from a Unix Terminal like this:

```
wget https://github.com/mittelmark/sbi/releases/download/v0.3.0/sbi_0.3.0.tar.gz
R CMD INSTALL sbi_0.3.0.tar.gz
```

Installation  as a package has the advantage  that you have the  documentation
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
Rscript sbi-src.R --check      sbi_0.3.0.tar.gz  # check package tar-gz file
Rscript sbi-src.R --install    sbi_0.3.0.tar.gz  # install from local tar-gz file
```


## Background

The   single   file  R   package   approach   is   described   in  the
[rsfp project](https://github.com/mittelmark/rsfp).

## Authors

- Detlef Groth, University of Potsdam (Author and Maintainer)
- Laura Schander, University of Potsdam (Contributor)

## License

MIT License see file [LICENSE](LICENSE).
