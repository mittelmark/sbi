# sbi - package

[![Release](https://img.shields.io/github/v/release/mittelmark/sbi.svg?label=current+release)](https://github.com/mittelmark/sbi/releases)
[![license](https://img.shields.io/badge/license-MIT-lightgray.svg)](https://opensource.org/license/MIT)
[![CI test](https://github.com/mittelmark/sbi/workflows/R/badge.svg)](https://www.gnu.org/licenses/gpl.html)

## Name

sbi - R functions for the course Statistical Bioinformatics

## Synopsis

```
library(sbi)
ls(sbi)
library(help="sbi")
```

## Description

Package  with  functions  for the  course  Statistical  Bioinformatics  at the
University  of Potsdam.  The course  takes place as a mandatory course for the
[Master Bioinformatics program](https://www.uni-potsdam.de/de/studium/studienangebot/masterstudium/master-a-z/bioinformatics-master)
every Winter semester.

## Installation

The  package  comes as a single  file R script.  You can  either  just  source
the latest version of that script directly from Github like this:


```
$ R    # starting R
> source("https://raw.githubusercontent.com/mittelmark/sbi/refs/heads/main/sbi-src.R")
> ls(sbi)
```

Or you can  install  it as a normal R package using the latest relases like this from a Unix Terminal:

```
wget https://github.com/mittelmark/sbi/releases/download/v0.0.3/sbi_0.0.3.tar.gz
R CMD INSTALL sbi_0.0.3.tar.gz
```

Or from within a R console

```
$ R
> install.packages("https://github.com/mittelmark/sbi/releases/download/v0.0.3/sbi_0.0.3.tar.gz",repos=NULL)
> library(sbi)
> ls(sbi)
```

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
Rscript sbi-src.R --check      sbi_0.0.1.tar.gz  # check package tar-gz file
Rscript sbi-src.R --install    sbi_0.0.1.tar.gz  # install from local tar-gz file
```


## Background

The   single   file  R   package   approach   is   described   in  the
[rzfp project](https://github.com/mittelmark/rzfp).

## Authors

- Detlef Groth, University of Potsdam (Author and Maintainer)
- Laura Schander, University of Potsdam (Contributor)

## License

MIT License see file [LICENSE](LICENSE).
