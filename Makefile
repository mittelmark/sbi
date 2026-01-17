##-*- makefile -*-############################################################
#  Created By    : Detlef Groth, University of Potsdam
#  Created       : Wed Aug 28 16:08:38 2024
#  Last Modified : <260117.1122>
#
#  Description	 : Makefile for creating packages from the sfrp-src.R script
#
##############################################################################
#
#  Copyright (c) 2024 Detlef Groth, University of Potsdam
# 
#  MIT-License - see the file LICENSE in this folder
#
##############################################################################

pkg=sbi
VERSION=$(shell grep -Eo "^#' Version: [.0-9]+" $(pkg)-src.R | sed -E 's/.+: //g; s/ //g;')
help:
	@printf "Usage:\n"
	@printf "   make build   pkg=sbi\n      for creating a true R package file named sbi_§(VERSION).tar.gz\n" 
	@printf "   make install pkg=sbi\n      for installing the package file sbi_$(VERSION).tar.gz\n"
build:
	-rm -rf $(pkg)/
	Rscript $(pkg)-src.R --process $(pkg)-src.R
	Rscript $(pkg)-src.R --vignettex $(pkg)-src.R	
	Rscript $(pkg)-src.R --build $(pkg)
	Rscript $(pkg)-src.R --check $(pkg)_$(VERSION).tar.gz

install: build	
	Rscript $(pkg)-src.R --install $(pkg)_$(VERSION).tar.gz

clean:
	-rm -rf $(pkg)/
	-rm -rf $(pkg).Rcheck
pdf:
	weasyprint sbi.Rcheck/sbi/doc/sbi-examples.html sbi-examples.pdf \
		-s assets/small.css
