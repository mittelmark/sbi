# sbi - package

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

The  package  comes as a single  file R script. You can  install  the  package
either as the latest relases like this from a Unix Terminal:

```
wget https://github.com/mittelmark/sbi/releases/download/v0.0.1/sbi_0.0.1.tar.gz
R CMD INSTALL sbi_0.0.1.tar.gz
```

Or from within a R console

```
$ R
> install.packages("https://github.com/mittelmark/sbi/releases/download/v0.0.1/sbi_0.0.1.tar.gz",repos=NULL)
```

Or you can install the latest development version dirctly from Github like this:

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
