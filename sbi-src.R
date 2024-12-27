#!/usr/bin/env Rscript
#' FILE: sbi/DESCRIPTION
#' Package: sbi
#' Type: Package
#' Title: R package for the course Statistical Bioinformatics at the University of Potsdam
#' Version: 0.0.5
#' Date: 2024-12-27
#' Author: Detlef Groth
#' Authors@R:c(
#'   person("Detlef","Groth", role=c("aut", "cre"),
#'   email = "dgroth@uni-potsdam.de",
#'   comment=c(ORCID="0000-0002-9441-3978")),
#'   person("Laura", "Schander", role = "ctb", 
#'   email = "laura.schander@uni-potsdam.de")
#'   )
#' Maintainer: Detlef Groth <dgroth@uni-potsdam.de>
#' Description: 
#'    This is a package template for the course Statistical Bioinformatics
#'    at the University of Potsdam. For the Master couses Bioinformatics.
#'    It contains methods introduced during the lectures and additional
#'    useful functions helpful for in general statistical analysis.
#' URL:  https://github.com/mittelmark/sbi
#' BugReports: https://github.com/mittelmark/sbi/issues
#' Imports: cluster
#' Suggests: knitr, rmarkdown, extrafont, MASS, digest, tcltk, png, tools
#' VignetteBuilder: knitr
#' License: MIT + file LICENSE
#' Language: en-US
#' Encoding: UTF-8
#' NeedsCompilation: no
#' Collate: sbi.R  assoc.R aggregate2.R angle.R bezier.R bootstrap.R
#'     cache_image.R chr2ord.R coa.R corr.R corplot.R corrplot.R corvar.R corvars.R  
#'     cohensD.R cohensF.R cohensH.R cohensW.R 
#'     cramersV.R cv.R deg2rad.R  df2md.R dict.R  dpairs.R dpairs_legend.R drop_na.R epsilonSquared.R etaSquared.R 
#'     file.cat.R file.head.R fmt.R flow.R gmean.R hmean.R import.R input.R is.dict.R is.outlier.R itemchart.R 
#'     kroki.R kurtosis.R lmplot.R mhist.R mi.R mkdoc.R modus.R pastel.R packageDependencies.R
#'     pairwise.effect_size.R
#'     pcor.R pcor.test.R
#'     pca_biplot.R pca_corplot.R pca_oncor.R pca_pairs.R pca_plot.R pca_to_data.R pca_variances.R pca_varplot.R
#'     rad2deg.R report_pval.R shell.R sdata.R sem.R shape.R skewness.R smartbind.R
#'     textplot.R untab.R venn.R wilcoxR.R
#'     ni.R pipe.R
#' FILE: sbi/LICENSE
#' YEAR: 2024
#' COPYRIGHT HOLDER: Detlef Groth

#' FILE: sbi/NEWS
#' 2024-12-27: Version 0.0.5 - adding itemchart function
#' 2024-11-07: Version 0.0.4 - adding function for pairwise effect sizes
#'
#' 2024-10-07: Version 0.0.3 - many new functions sbi.R from beeproject
#'
#' 2024-09-12: Version 0.0.2 - 4 new functions
#'    - sbi_angle
#'    - sbi_bezier
#'    - sbi_bootstrap
#'    - sbi_cache_image
#'
#' 2024-08-28: Version 0.0.1 - Initial Release

#' FILE: sbi/NAMESPACE
#' exportPattern("^[[:lower:]]+")
#' export("%>%")
#' export("%ni%")
#' importFrom("stats", "density","sd","cor","cor.test","aov","chisq.test","fisher.test","kruskal.test","lm",
#'            "model.frame","predict", "rgamma", "runif", "spline",
#'            "aggregate","prop.test","t.test", "formula", "na.omit", "pnorm", "residuals",
#'            "qnorm", "wilcox.test","cov", "qchisq")
#' importFrom("graphics", "axTicks","barplot","boxplot", "hist","legend","pairs", "par","polygon", 
#'             "arrows", "lines", "text", "rect", "plot", "axis", "box",
#'            "abline","points")
#' importFrom("grDevices", "col2rgb", "rgb")
#' importFrom("utils","head","read.table","installed.packages")
#' importFrom("tools","package_dependencies")
###' importFrom("digest","digest")
#'
#' FILE: sbi/inst/files/decathlon.tab
#' 100	long	shot	high	400	110	disq	pole	jave	1500
#' 1	32	7.43	15.48	2.27	29.4479	26.1732	49.28	4.7	61.32	20.0781
#' 2	33.1187	7.45	14.97	1.97	30.1824	27.3859	44.36	5.1	61.76	19.7788
#' 3	32.2004	7.44	14.2	1.97	29.8198	26.7387	43.66	5.2	64.16	20.5167
#' 4	33.8983	7.38	15.02	2.03	29.3518	26.9022	44.8	4.9	64.04	18.9401
#' 5	32.6679	7.43	12.92	1.97	30.3541	27.5	41.2	5.2	57.46	21.0411
#' 6	33.241	7.72	13.58	2.12	29.789	27.9267	43.06	4.9	52.18	19.703
#' 7	32.2004	7.05	14.12	2.06	29.1852	27.5191	41.68	5.7	61.6	18.544
#' 8	32.5792	6.95	15.34	2	29.8693	27.5766	41.32	4.8	63	20.3114
#' 9	32.287	7.12	14.52	2.03	29.2981	27.0123	42.36	4.9	66.46	20.0282
#' 10	32.057	7.28	15.25	1.97	29.6296	26.8293	48.02	5.2	59.48	18.478
#' 11	32.9068	7.45	15.34	1.97	28.8346	27.7895	41.86	4.8	66.64	18.25
#' 12	32.2004	7.34	14.48	1.94	29.3758	26.2078	42.76	4.7	65.84	21.033
#' 13	32.6679	7.29	12.92	2.06	29.8569	26.506	39.54	5	56.8	20.9424
#' 14	32.7571	7.37	13.61	1.97	30.1066	26.9388	43.88	4.3	66.54	20.0766
#' 15	32.6383	7.45	14.2	1.97	29.4238	25.6477	41.66	4.7	64	20.1884
#' 16	32.4617	7.08	14.51	2.03	28.8635	26.793	43.2	4.9	57.18	20.1087
#' 17	31.4136	6.75	16.07	2	28.0811	24.6575	50.66	4.8	72.6	17.856
#' 18	31.115	7	16.6	1.94	28.8925	26.4	46.66	4.9	60.2	18.8785
#' 19	32.5203	7.04	13.41	1.94	30.0188	26.4706	40.38	4.5	51.5	20.5785
#' 20	33.0579	7.07	15.84	1.79	28.9855	25.7477	45.32	4.9	60.48	19.4356
#' 21	31.25	7.36	13.93	1.94	28.8058	25.3197	38.82	4.6	67.04	20.2687
#' 22	31.3316	7.02	13.8	2.03	28.4585	26.0184	39.08	4.7	60.92	20.5378
#' 23	31.6344	7.08	14.31	2	28.6624	26.4529	46.34	4.4	55.68	19.8034
#' 24	31.8584	6.97	13.23	2.15	28.8115	25.7477	38.72	4.6	54.34	19.4356
#' 25	32.7273	7.23	13.15	2.03	28.9564	26.4706	38.06	4.5	52.82	18.9095
#' 26	31.7741	6.83	11.63	2.06	29.7705	25.731	37.52	4.6	55.42	19.9948
#' 27	32.4324	6.98	12.69	1.82	29.6114	26.1732	38.04	4.7	49.52	20.6186
#' 28	31.2772	7.01	14.17	1.94	28.147	26.087	45.84	4.6	56.28	17.8118
#' 29	31.9716	6.9	12.41	1.88	29.8507	25.3684	38.02	4.4	52.68	19.8486
#' 30	31.3043	7.09	12.94	1.82	29.2267	25.4499	42.32	4.5	53.5	18.3767
#' 31	31.4961	6.22	13.98	1.91	28.0976	24.937	46.18	4.6	57.84	18.3057
#' 32	31.3862	6.43	12.33	1.94	28.6282	26.4	38.72	4	57.26	18.3849
#' 33	31.115	7.19	10.27	1.91	28.3968	24.4444	34.36	4.1	54.94	20.0015
#' FILE: sbi/man/sbi-package.Rd
#' \name{sbi-package}
#' \alias{sbi-package}
#' \title{The sbi-package - methods for Statistical Bioinformatics}
#' \description{The sbi package contains methods used in the course
#'    Statistical Bioinformatics at the University of Potsdam
#'    as well as othe rusefule methods useful in statistical analysis.
#' }
#' \details{
#' Here the list of functions provided by this package:
#' \describe{
#' \item{\link[sbi:sbi_aggregate2]{sbi$aggregate2(x,y,z,FUN=cor,...)}}{Aggregate two variables against one factor variable}
#' \item{\link[sbi:sbi_angle]{sbi$angle(x,y,degree=FALSE)}}{determine the angle between two vectors}
#' \item{\link[sbi:sbi_assoc]{sbi$assoc(..., shade=TRUE)}}{Create assocplots with residual coloring}
#' \item{\link[sbi:sbi_bezier]{sbi$bezier(p1,p2,p3)}}{create bezier lines using three coordinates}
#' \item{\link[sbi:sbi_bootstrap]{sbi$bootstrap(x,FUN=NULL,n=1000,...)}}{perform a resampling for the given data set and function}
#' \item{\link[sbi:sbi_cache_image]{sbi$cache_image(url,extension="png")}}{create a crc32 image for a downloaded image from the internet if not yet there}
#' \item{\link[sbi:sbi_chr2ord]{sbi$chr2ord(x,map)}}{convert factors or characters to ordinal numbers}
#' \item{\link[sbi:sbi_coa]{sbi$coa(x,map)}}{co-occurence analysis}
#' \item{\link[sbi:sbi_cohensD]{sbi$cohensD(x,y)}}{Effect size comparing two means}
#' \item{\link[sbi:sbi_cohensF]{sbi$cohensF(x,y)}}{Effect size comparing for an ANOVA}
#' \item{\link[sbi:sbi_cohensW]{sbi$cohensH(x)}}{Effect size for 2x2 contingency tables}
#' \item{\link[sbi:sbi_corplot]{sbi$corplot(x, y, col="red", pch=19,...)}}{Visualize a correlation with abline.}
#' \item{\link[sbi:sbi_corr]{sbi$corr(data,method="pearson",use="pairwise.complete.obs")}}{Calculate pairwise correlations for a given data frame or matrix}
#' \item{\link[sbi:sbi_corrplot]{sbi$corrplot(mt,...)}}{Visualize a correlation matrix.}
#' \item{\link[sbi:sbi_corvar]{sbi$corvar(x,r,mean=0,sd=1)}}{create a vector with a given correlation to an other vector}
#' \item{\link[sbi:sbi_corvars]{sbi$corvars(n,r.matrix,mu.vec)}}{create a data frame with a given correlation structure}
#' \item{\link[sbi:sbi_cramersV]{sbi$cramersV(tab)}}{Calculate Cramer's V for a contingency table as an effect size measure.}
#' \item{\link[sbi:sbi_cv]{sbi$cv(x,na.rm=FALSE)}}{Calculate the coefficient of variation.}
#' \item{\link[sbi:sbi_deg2rad]{sbi$deg2rad(x)}}{Convert an angle in degrees to radians.}
#' \item{\link[sbi:sbi_df2md]{sbi$df2md(x, rownames=TRUE, caption="")}}{Convert a data frame or matrix into a Markdown table}
#' \item{\link[sbi:sbi_dict]{sbi$dict(...)}}{Create a dictionary (list with unique keys)}
#' \item{\link[sbi:sbi_dpairs]{sbi$dpairs(...)}}{Improved pairs plot with xyplot, boxplot or assocplot depending on the variable types}
#' \item{\link[sbi:sbi_dpairs_legend]{sbi$dpairs_legend(...)}}{adding legends to pairs and dpairs plots}
#' \item{\link[sbi:sbi_drop_na]{sbi$drop_na(...)}}{remove all rows where any of the given columns contain a NA - so missing values}
#' \item{\link[sbi:sbi_epsilonSquared]{sbi$epsilonSquared(x, y=NULL)}}{Calculate the effect size epsilon-squared for variables of a Kruskal-Wallis test.}
#' \item{\link[sbi:sbi_etaSquared]{sbi$etaSquared(x, y=NULL)}}{Calculate the effect size eta-squared for an Anova or a linear model.}
#' \item{\link[sbi:sbi_file.cat]{sbi$file.cat(filename)}}{Displays a file to the terminal, not to stdout.}
#' \item{\link[sbi:sbi_file.head]{sbi$file.head(filename,n=6)}}{Displays the first n lines of a file to the terminal.}
#' \item{\link[sbi:sbi_flow]{sbi$flow(x, y=NULL, z=NULL, ...)}}{Very simple flowcharter to create flow diagrams}
#' \item{\link[sbi:sbi_fmt]{sbi$fmt(str,...)}}{Python like string formatting}
#' \item{\link[sbi:sbi_gmean]{sbi$gmean(x)}}{geometric mean}
#' \item{\link[sbi:sbi_hmean]{sbi$hmean(x)}}{harmonic mean}
#' \item{\link[sbi:sbi_import]{sbi$import(basename)}}{load other R files, relative to the current script file}
#' \item{\link[sbi:sbi_input]{sbi$input(prompt)}}{get input from the user, as well in Rscript files}
#' \item{\link[sbi:sbi_is.dict]{sbi$is.dict(x)}}{Check if the given object is a dictionary (list with unique keys)}
#' \item{\link[sbi:sbi_is.outlier]{sbi$is.outlier(x)}}{check if a given value within a vector is an outlier}
#' \item{\link[sbi:sbi_itemchart]{sbi$itemchart(labels)}}{visualization of short item lists with 3 to four items}
#' \item{\link[sbi:sbi_kroki]{sbi$kroki(text,type="ditaa",ext="png")}}{create flowcharts using the kroki online tool}
#' \item{\link[sbi:sbi_kurtosis]{sbi$kurtosis(x)}}{fourth central moment of a distribution}
#' \item{\link[sbi:sbi_lmplot]{sbi$lmplot(x,y)}}{XY-plot with linear model and the confidence intervals}
#' \item{\link[sbi:sbi_mhist]{sbi$mhist(x,y)}}{lattice like histogram}
#' \item{\link[sbi:sbi_mi]{sbi$mi(x,y)}}{mutual information for two numerical variables or a binned table}
#' \item{\link[sbi:sbi_mkdoc]{sbi$mkdoc(infile)}}{convert mkdoc documentation to HTML}
#' \item{\link[sbi:sbi_modus]{sbi$modus(catvar)}}{Return the most often level in a categorical variable.}
#' \item{\link[sbi:sbi_pastel]{sbi$pastel(n)}}{create up to 20 pastel colors}
#' \item{\link[sbi:sbi_packageDependencies]{sbi$packageDependencies(pkgname)}}{return the dependencies of the given package}
#' \item{\link[sbi:sbi_pairwise.effect_size]{sbi$pairwise.effect_size(x,y=NULL)}}{pairwise effect size measures for more than two factors}
#' \item{\link[sbi:sbi_pca_biplot]{sbi$pca_biplot(x)}}{improved biplot for pca objects (plot)}
#' \item{\link[sbi:sbi_pca_corplot]{sbi$pca_corplot(x)}}{correlation plot for original variables and PCs}
#' \item{\link[sbi:sbi_pca_oncor]{sbi$pca_oncor(x)}}{perform a PCA on a squared (correlation) matrix (stats)}
#' \item{\link[sbi:sbi_pca_pairs]{sbi$pca_pairs(x)}}{improved pairs plot for pca objects (plot)}
#' \item{\link[sbi:sbi_pca_plot]{sbi$pca_plot(x)}}{improved screeplot for pca objects (plot)}
#' \item{\link[sbi:sbi_pca_to_data]{sbi$pca_to_data(pca)}}{transform prcomp PCA objects  back to data (pca, data)}
#' \item{\link[sbi:sbi_pca_variances]{sbi$pca_variances(pca)}}{absolute variance contributions of variables to PC's (pca, data)}
#' \item{\link[sbi:sbi_pca_varplot]{sbi$pca_varplot(pca)}}{PCA variance plot (pca, plot)}
#' \item{\link[sbi:sbi_pcor]{sbi$pcor(x,y,z,method="pearson")}}{partial correlation}
#' \item{\link[sbi:sbi_pcor.test]{sbi$pcor.test(x,y,z,method="pearson")}}{partial correlation test}
#' \item{\link[sbi:sbi_rad2deg]{sbi$rad2deg(x)}}{Convert angle in radian into angle in degree}
#' \item{\link[sbi:sbi_report_pval]{sbi$report_pval(p, star=FALSE)}}{Report a p-value with optional stars based on significance thresholds}
#' \item{\link[sbi:sbi_sdata]{sbi$sdata(name)}}{Load small data sets like 'c20' or 'azt'.}
#' \item{\link[sbi:sbi_sem]{sbi$sem(x, na.rm=FALSE)}}{standard error of the mean}
#' \item{\link[sbi:sbi_shape]{sbi$shape(x,y)}}{Create random polygon shapes centered at given x and y coordinates}
#' \item{\link[sbi:sbi_shell]{sbi$shell(script)}}{Executes a given sell script in text format (Unix only)}
#' \item{\link[sbi:sbi_skewness]{sbi$skewness(x)}}{third central moment of a distribution}
#' \item{\link[sbi:sbi_smartbind]{sbi$smartbind(x,y)}}{Bind two data frames by matching column names, filling in missing columns with NAs.}
#' \item{\link[sbi:sbi_textplot]{sbi$textplot(x,caption=NULL)}}{Display a data frame or matrix in a plot.}
#' \item{\link[sbi:sbi_untab]{sbi$untab(x)}}{expand a contingency table to a data frame one item per row (data)}
#' \item{\link[sbi:sbi_venn]{sbi$venn(x)}}{Venn diagram for logical relations between two and three sets (plot)}
#' \item{\link[sbi:sbi_wilcoxR]{sbi$wilcoxR(x)}}{calculate effect size r, for a wilcox test object (effect size, stats)}
#' \item{\link[sbi:sbi_pipe]{lhs \%>\% rhs}}{pipe operator}
#' \item{\link[sbi:sbi_ni]{lhs \%ni\% rhs}}{not in operator}
#' }
#' }
#' \value{returns the result of addition of x and y} 
#' \examples{
#' library(sbi)
#' data(iris)
#' data(swiss)
#' sbi_aggregate2(iris$Sepal.Length, iris$Sepal.Width, iris$Species)
#' lapply(sbi$corr(swiss)[1:2], round, 2)
#' sbi$assoc(margin.table(HairEyeColor, c(1, 2)))
#' sbi$textplot(head(swiss), caption="Table 1: Swiss data first six lines")
#' par(mai=rep(0.1,4))
#' sbi$flow(x = "A1", y = "B2", lab = "Test", type = "rect")
#' } %exend
#' \author{
#' Detlef Groth, University of Potsdam, \email{dgroth@uni-potsdam.de},
#' Laura Schander, University of Potsdam, \email{laura.schander@example.com}
#' }
#'  
#' FILE: sbi/man/sbi.Rd
#' \name{sbi}  
#' \alias{sbi} 
#' \alias{sbi-class} 
#' \title{Environment object with functions for ...} 
#' \description{ 
#' The functions within the sbi environment are functions used in ...
#' }
#' \section{Methods}{ 
#' \itemize{ 
#' \item \code{\link[sbi:sbi_aggregate2]{sbi$aggregate2(x,y,z,FUN=cor,...)}} aggregate two variables against one factor variable
#' \item \code{\link[sbi:sbi_angle]{sbi$angle(x,y, degree=FALSE)}} determine the angle between two vectors
#' \item \code{\link[sbi:sbi_assoc]{sbi$assoc(..., shade=TRUE)}} Create assocplots with residual coloring
#' \item \code{\link[sbi:sbi_bezier]{sbi$bezier(p1,p2,p3)}} create bezier lines using three coordinates
#' \item \code{\link[sbi:sbi_bootstrap]{sbi$bootstrap(x,FUN=NULL,n=1000,...)}} perform a resampling for the given data set and function
#' \item \code{\link[sbi:sbi_cache_image]{sbi$cache_image(url,extension="png")}} create a crc32 image for a downloaded image from the internet if not yet there
#' \item \code{\link[sbi:sbi_chr2ord]{sbi$chr2ord(x,map)}} convert factors or characters to ordinal numbers
#' \item \code{\link[sbi:sbi_coa]{sbi$coa(x,map)}} co-occurence analysis 
#' \item \code{\link[sbi:sbi_cohensD]{sbi$cohensD(x,y)}} Effect size comparing two means
#' \item \code{\link[sbi:sbi_cohensF]{sbi$cohensF(x,y)}} Effect size comparing for an ANOVA
#' \item \code{\link[sbi:sbi_cohensW]{sbi$cohensH(x)}} Effect size for 2x2 contingency tables
#' \item \code{\link[sbi:sbi_corplot]{sbi$corplot(x, y, col="red", pch=19,...)}} Visualize a correlation with abline.
#' \item \code{\link[sbi:sbi_corr]{sbi$corr(data,method="pearson",use="pairwise.complete.obs")}} calculate pairwise correlations for a given data frame or matrix
#' \item \code{\link[sbi:sbi_corrplot]{sbi$corrplot(mt,...)}} Visualize a correlation matrix.
#' \item \code{\link[sbi:sbi_corvar]{sbi$corvar(x,r,mean=0,sd=1)}} create a vector with a given correlation to an other vector
#' \item \code{\link[sbi:sbi_corvars]{sbi$corvars(n,r.matrix,mu.vec)}} create a data frame with a given correlation structure
#' \item \code{\link[sbi:sbi_cramersV]{sbi$cramersV(tab)}} Calculate Cramer's V for a contingency table as an effect size measure
#' \item \code{\link[sbi:sbi_cv]{sbi$cv(x,na.rm=FALSE)}} Calculate the coefficient of variation
#' \item \code{\link[sbi:sbi_deg2rad]{sbi$deg2rad(x)}} Convert an angle in degrees to radians.
#' \item \code{\link[sbi:sbi_df2md]{sbi$df2md(x, rownames=TRUE, caption="")}} convert a data frame or matrix into a Markdown table  
#' \item \code{\link[sbi:sbi_dict]{sbi$dict(...)}} create a dictionary (list with unique keys)  
#' \item \code{\link[sbi:sbi_dpairs]{sbi$dpairs(...)}} Improved pairs plot with xyplot, boxplot or assocplot depending on the variable types
#' \item \code{\link[sbi:sbi_dpairs_legend]{sbi$dpairs_legend(...)}} adding legends to pairs and dpairs plots
#' \item \code{\link[sbi:sbi_drop_na]{sbi$drop_na(...)}} remove all rows where any of the given columns contain a NA - so missing values
#' \item \code{\link[sbi:sbi_epsilonSquared]{sbi$epsilonSquared(x, y=NULL)}} Calculate the effect size epsilon-squared for variables of a Kruskal-Wallis test.
#' \item \code{\link[sbi:sbi_etaSquared]{sbi$etaSquared(x, y=NULL)}} Calculate the effect size eta-squared for an Anova or a linear model.
#' \item \code{\link[sbi:sbi_file.cat]{sbi$file.cat(filename)}} Displays a file to the terminal, not to stdout.
#' \item \code{\link[sbi:sbi_file.head]{sbi$file.head(filename, n=6)}} Displays the first n lines of a file to the terminal.
#' \item \code{\link[sbi:sbi_flow]{sbi$flow(x, y=NULL, z=NULL, ...)}} Create flowcharts with rectangles, arrows, and lines
#' \item \code{\link[sbi:sbi_fmt]{sbi$fmt(str,...)}} Python like string formatting
#' \item \code{\link[sbi:sbi_gmean]{sbi$gmean(x)}} geometric mean
#' \item \code{\link[sbi:sbi_hmean]{sbi$hmean(x)}} harmonic mean
#' \item \code{\link[sbi:sbi_import]{sbi$import(basename)}} load other R files, relative to the current script file
#' \item \code{\link[sbi:sbi_input]{sbi$input(prompt)}} get input from the user, as well in Rscript files
#' \item \code{\link[sbi:sbi_is.dict]{sbi$is.dict(x)}} check if an object is a dictionary (list with unique keys)
#' \item \code{\link[sbi:sbi_is.outlier]{sbi$is.outlier(x)}} check if a given value within a vector is an outlier
#' \item \code{\link[sbi:sbi_itemchart]{sbi$itemchart(labels)}} visualization of short item lists with 3 to four items
#' \item \code{\link[sbi:sbi_kroki]{sbi$kroki(text,type="ditaa",ext="png")}} create flowcharts using the kroki online tool
#' \item \code{\link[sbi:sbi_lmplot]{sbi$lmplot(x,y)}} XY-plot with linear model and the confidence intervals.
#' \item \code{\link[sbi:sbi_mhist]{sbi$mhist(x,y)}} lattice like histogram
#' \item \code{\link[sbi:sbi_mi]{sbi$mi(x,y)}} mutual information for two numerical variables or a binned table
#' \item \code{\link[sbi:sbi_mkdoc]{sbi$mkdoc(infile)}} convert mkdoc documentation to HTML
#' \item \code{\link[sbi:sbi_modus]{sbi$modus(catvar)}} return the most often level in a categorical variable
#' \item \code{\link[sbi:sbi_pastel]{sbi$pastel(n)}} create up to 20 pastel colors
#' \item \code{\link[sbi:sbi_packageDependencies]{sbi$packageDependencies(pkgname)}} return the dependencies of the given package
#' \item \code{\link[sbi:sbi_pairwise.effect_size]{sbi$pairwise.effect_size(x,y=NULL)}} pairwise effect size measures for more than two factors
#' \item \code{\link[sbi:sbi_pca_biplot]{sbi$pca_biplot(x)}} improved biplot for pca objects (plot)
#' \item \code{\link[sbi:sbi_pca_corplot]{sbi$pca_corplot(x)}} correlation plot for original variables and PCs (plot)
#' \item \code{\link[sbi:sbi_pca_oncor]{sbi$pca_oncor(x)}} perform a PCA on a squared (correlation) matrix (stats)
#' \item \code{\link[sbi:sbi_pca_pairs]{sbi$pca_pairs(x)}} improved pairs plot for pca objects (plot)
#' \item \code{\link[sbi:sbi_pca_plot]{sbi$pca_plot(x)}} improved screeplot for pca objects (plot)
#' \item \code{\link[sbi:sbi_pca_to_data]{sbi$pca_to_data(pca)}} transform prcomp PCA objects  back to data (pca, data)
#' \item \code{\link[sbi:sbi_pca_variances]{sbi$pca_variances(pca)}} absolute variance contributions of variables to PC's (pca, data)
#' \item \code{\link[sbi:sbi_pca_varplot]{sbi$pca_varplot(pca)}} PCA variance plot (pca, plot)
#' \item \code{\link[sbi:sbi_pcor]{sbi$pcor(x,y,z,method="pearson")}} partial correlation
#' \item \code{\link[sbi:sbi_pcor.test]{sbi$pcor.test(x,y,z,method="pearson")}} partial correlation test
#' \item \code{\link[sbi:sbi_rad2deg]{sbi$rad2deg(x)}} convert angle in radian into angle in degree
#' \item \code{\link[sbi:sbi_report_pval]{sbi$report_pval(p, star = FALSE)}} report a p-value with optional stars based on significance thresholds
#' \item \code{\link[sbi:sbi_sdata]{sbi$sdata(name)}} load small data sets like 'c20' or 'azt'.
#' \item \code{\link[sbi:sbi_sem]{sbi$sem(x, na.rm=FALSE)}} standard error of the mean
#' \item \code{\link[sbi:sbi_shape]{sbi$shape(x,y)}} create random polygon shapes centered at given x and y coordinates
#' \item \code{\link[sbi:sbi_shell]{sbi$shell(script)}} executes a given sell script in text format (Unix only)
#' \item \code{\link[sbi:sbi_smartbind]{sbi$smartbind(x,y)}} bind two data frames by matching columns and filling missing values with NA.
#' \item \code{\link[sbi:sbi_textplot]{sbi$textplot(x,caption=NULL)}} display a small data frame or matrix inside a plot.
#' \item \code{\link[sbi:sbi_untab]{sbi$untab(x)}} expand a contingency table to a data frame one item per row (data)
#' \item \code{\link[sbi:sbi_venn]{sbi$venn(x)}} Venn diagram for logical relations between two and three sets (plot)
#' \item \code{\link[sbi:sbi_wilcoxR]{sbi$wilcoxR(x)}} calculate effect size r, for a wilcox test object (effect size, stats)
#' \item \code{\link[sbi:sbi_pipe]{lhs \%>\% rhs}} pipe operator
#' \item \code{\link[sbi:sbi_ni]{lhs \%ni\% rhs}} not in operator
#' }
#' } 
#' \examples{ 
#' class(sbi)
#' ls(sbi) ## methods
#' } 

#' FILE: sbi/R/sbi.R
## sbi-environment

sbi=new.env()

## Actual code starts
## Functions documentation, protect percent signs % with backslashes \%

#' FILE: sbi/man/sbi_aggregate2.Rd
#' \name{sbi$aggregate2}
#' \alias{sbi$aggregate2}
#' \alias{sbi_aggregate2}
#' \title{Aggregate two variables against one factor variable}
#' \description{Aggregate two variables (usually numerical) against one factor variable using the given function.}
#' \usage{sbi_aggregate2(x, y, z, FUN = cor, ...)}
#' \arguments{
#'   \item{x}{a numeric vector}
#'   \item{y}{a numeric vector}
#'   \item{z}{a factor vector}
#'   \item{FUN}{a function to apply, default is \code{cor}}
#'   \item{...}{additional arguments to pass to \code{FUN}}
#' }
#' \details{
#' This function splits the data by the factor \code{z} and applies the function \code{FUN}
#' to the two numeric vectors \code{x} and \code{y}. The result is a named numerical vector
#' where names correspond to the levels of \code{z}.
#' }
#' \value{A named numerical vector with results of applying \code{FUN} to each split group.}
#' \examples{
#' data(iris)
#' sbi$aggregate2(iris$Sepal.Length, iris$Sepal.Width, iris$Species)
#' sbi$aggregate2(iris$Sepal.Length, iris$Sepal.Width, iris$Species, FUN = cov)
#' sbi$aggregate2(iris$Sepal.Length, iris$Sepal.Width, iris$Species, FUN = sbi$mi)
#' }
#' \seealso{\link[sbi:sbi-package]{sbi-package}}
#' FILE: sbi/R/aggregate2.R
sbi$aggregate2 <- function (x, y, z, FUN = cor, ...) {
  return(unlist(lapply(split(data.frame(x = x, y = y), z), function(X) FUN(X[,1], X[,2]))))
}

sbi_aggregate2 = sbi$aggregate2

#' FILE: sbi/man/sbi_angle.Rd
#' \name{sbi$angle}
#' \alias{sbi$angle}
#' \alias{sbi_angle}
#' \title{determine the angle between two vectors}
#' \description{Determine the angle between two vectors either in rad (default) or degrees}
#' \usage{sbi_angle(x, y, degree=FALSE)}
#' \arguments{
#'   \item{x}{numeric vector with x and y positions}
#'   \item{y}{numeric vector with x and y positions}
#'   \item{degree}{should the angle returned in degree value, default: FALSE}
#' }
#' \details{
#'   This function should be used to calculate angles in geometry problems.
#' }
#' \value{angle either in rad or in degrees}
#' \examples{
#' x=c(1,2)
#' y=c(2,1)
#' sbi$angle(x,y)
#' sbi$angle(x,y,degree=TRUE)
#' plot(0,type="n",xlim=c(0,2.2),ylim=c(0,2),xlab="",ylab="")
#' grid()
#' arrows(0,0,x[1],x[2],col="red",lwd=3)
#' arrows(0,0,y[1],y[2],col="blue",lwd=3)
#' text(x[1]+0.1,x[2],"x",col="red",cex=2)
#' text(y[1]+0.1,y[2],"y",col="blue",cex=2)
#' }
#' \seealso{\link[sbi:sbi-package]{sbi-package}, 
#' \link[sbi:sbi_deg2rad]{sbi$deg2rad},
#' \link[sbi:sbi_rad2deg]{sbi$rad2deg}.}
#' FILE: sbi/R/angle.R
sbi$angle <- function (x,y,degree=FALSE) {
    euc = function(x) {
        x <- matrix(x, ncol = 1)
        return(sqrt(colSums(x^2)))
    }
    theta <- acos(x %*% y/(euc(x) * euc(y)))
    if (degree) {
        theta <- sbi$rad2deg(theta)
    }
    return(theta[1,1])
}

sbi_angle = sbi$agngle

#' FILE: sbi/man/sbi_corr.Rd
#' \name{sbi$corr}
#' \alias{sbi$corr}
#' \alias{sbi_corr}
#' \title{Calculate pairwise correlations for a given data frame or matrix}
#' \description{Calculate pairwise correlations for a given data frame or matrix.}
#' \usage{sbi_corr(data, method = "pearson", use = "pairwise.complete.obs")}
#' \arguments{
#'   \item{data}{A matrix or data frame where the variables are in the columns, NA's are allowed.}
#'   \item{method}{The type of correlation to be determined, either 'pearson', 'spearman', or 'kendall'. Default: 'pearson'.}
#'   \item{use}{How to deal with NA's. Default: 'pairwise.complete.obs'.}
#' }
#' \details{
#'   This function calculates pairwise correlations for each combination of variables in the given data frame or matrix.
#'   The method for calculating correlation can be specified, and the handling of missing values can be controlled using the \code{use} argument.
#' }
#' \value{
#'   A list with the following components:
#'   \item{estimate}{A matrix of correlation values.}
#'   \item{p.value}{A matrix of p-values corresponding to the correlations.}
#'   \item{method}{A character string indicating the correlation method used.}
#' }
#' \examples{
#' data(swiss)
#' lapply(sbi$corr(swiss)[1:2], round, 2)
#' }
#' \seealso{\link[sbi:sbi-package]{sbi-package}}
#' 
#' FILE: sbi/R/corr.R

sbi$corr <- function (data, method = "pearson", use = "pairwise.complete.obs") {
  mt <- matrix(0, nrow = ncol(data), ncol = ncol(data))
  colnames(mt) <- rownames(mt) <- colnames(data)
  mt.pval <- mt
  diag(mt) <- 1
  for (i in 1:(ncol(data) - 1)) {
    for (j in (i + 1):ncol(data)) {  # Adjusted loop to avoid self-correlation
      rt <- cor.test(data[, i], data[, j], method = method, use = use)
      mt[i, j] <- mt[j, i] <- rt$estimate
      mt.pval[i, j] <- mt.pval[j, i] <- rt$p.value
    }
  }
  return(list(estimate = mt, p.value = mt.pval, method = method))
}

sbi_corr = sbi$corr

#' FILE: sbi/man/sbi_assoc.Rd
#' \name{sbi$assoc}
#' \alias{sbi$assoc}
#' \alias{sbi_assoc}
#' \title{Create assocplots with residual coloring}
#' \description{
#'   Create assocplots with residual coloring. This function updates the standard \code{assocplot}
#'   function from the \code{graphics} package with the ability to display residual colors.
#' }
#' \usage{sbi_assoc(..., shade = TRUE)}
#' \arguments{
#'   \item{...}{Arguments delegated to the standard \code{assocplot} function.}
#'   \item{shade}{Logical; should the residuals be shown, default: \code{TRUE}.}
#' }
#' \details{
#'   In blue and red are shown groups with residuals above +4 or below -4; in lighter colors are shown residuals between +2 and +4, and -4 and -2, respectively.
#' }
#' \value{
#'   Creates an association plot with optional residual coloring.
#' }
#' \examples{
#' x <- margin.table(HairEyeColor, c(1, 2))
#' sbi$assoc(x)
#' }
#' \seealso{\link[sbi:sbi-package]{sbi-package}}
#' FILE: sbi/R/assoc.R
sbi$assoc <- function (..., shade = TRUE) {
  # https://stackoverflow.com/questions/38732663/how-to-insert-expression-into-the-body-of-a-function-in-r
  funins = function(f, expr = expression(x <- 2 * x), after = 1) {
    body(f) <- as.call(append(as.list(body(f)), expr, after = after))
    f
  }
  
  expr = expression({
    # DG: changed for shade
    residuals = chisq.test(x)$residuals
    cols = c('#CF3761', '#E18E9E', '#E0E0E0', '#96A2DF', '#4267E0')
    resis = c()
    # R plots from top right to lower left ...
    # we rearrange the colors
    for (c in ncol(x):1) {
      resis = c(resis, residuals[, c])
    }
    acols = cols[cut(resis,
                     breaks = c(-Inf, -4, -2, 2, 4, Inf),
                     labels = c(1, 2, 3, 4, 5))]
    rect(z[, 1] - e/2, z[, 2], z[, 1] + e/2, z[, 2] + d, col = acols)
  })
  if (shade) {
    g <- funins(graphics::assocplot, expr, after = length(body(graphics::assocplot)))
    g(...)
  } else {
    graphics::assocplot(...)
  }
}

sbi_assoc = sbi$assoc

#' FILE: sbi/man/sbi_bezier.Rd
#' \name{sbi$bezier}
#' \alias{sbi_bezier}
#' \alias{sbi$bezier}
#' \title{create bezier lines using three coordinates}
#' \description{
#'   This function creates bezier lines based on three coordinates.
#'   For more background information consult this discussion on
#'   [stats.stackexchange](https://stats.stackexchange.com/questions/294824/r-understanding-bezier-curves).
#' }
#' \usage{sbi_bezier(p1,p2,p3,plot=FALSE, arrow=FALSE,
#'                      arrow.pos=0.55,lwd=2,lty=1,...)}
#' \arguments{
#'   \item{p1}{starting point as vector of x and y}
#'   \item{p2}{curve point as vector of x and y}
#'   \item{p3}{end point as vector of x and y}
#'   \item{plot}{should the curve added to an existing plot, default: FALSE}
#'   \item{arrow}{should an error be plotted if plot=TRUE, default: FALSE}
#'   \item{arrow.pos}{where the place the arrow, between 0 and 1, default: 0.55}
#'   \item{lwd}{line width for line and arrow, default: 2}
#'   \item{lty}{line type for the bezier line if plotted, default: 1}
#'   \item{...}{other arguments forwarded to the line and the arrows function}
#' }
#' \value{if plot=FALSE returns list with x and y coordinates}
#' \examples{
#' plot(1,type="n",xlim=c(0,10),ylim=c(0,10))
#' sbi$bezier(c(1,3),c(3,5),c(5,3),plot=TRUE,arrow=TRUE,col="red")
#' sbi$bezier(c(1,3),c(3,7),c(5,3),plot=TRUE,arrow=TRUE,col="red",lty=2)
#' sbi$bezier(c(5,3),c(3,1),c(1,3),plot=TRUE,arrow=TRUE,col="red",lty=1)
#' sbi$bezier(c(5,3),c(3,-1),c(1,3),plot=TRUE,arrow=TRUE,col="red",lty=2)
#' sbi$bezier(c(8,2),c(6,7),c(0,8),plot=TRUE,arrow=TRUE,col="blue", lty=2,arrow.pos=0.8)
#' }
#' \seealso{\link[sbi:sbi-package]{sbi-package},
#' \url{https://stats.stackexchange.com/questions/294824/r-understanding-bezier-curves}}

#' FILE: sbi/R/bezier.R
sbi$bezier <- function (p1,p2,p3,plot=FALSE, arrow=FALSE, arrow.pos=0.55,lwd=2,lty=1,...) {
    B = function( t, P0, P1, P2 ) {
        (1 - t) * ( (1 - t)*P0 + t*P1 ) +
        t       * ( (1 - t)*P1 + t*P2 ) 
    }
    idx=arrow.pos
    steps=seq(0,1,by=0.02)
    x=c()
    y=c()
    for (s in steps) { 
        p=B(s,p1,p2,p3);
        x=c(x,p[1])
        y=c(y,p[2])
    }
    if (is.null(idx)) {
        idx=round(length(x)/2)-1
    } else {
        idx=round(length(x)*idx)
    }
    if (plot) {
        points(x,y,type="l",lwd=lwd,lty=lty,...)

        if (arrow) {
            for (i in c(15,10,5,2)) {
                arrows(x[idx],y[idx],x[idx+1],y[idx+1],length=0.2,angle=i,lwd=2,lty=1,...)
            }
        }
    } else {
        return(list(x=x,y=y))
    }
}
sbi_bezier = sbi$bezier

#' FILE: sbi/man/sbi_bootstrap.Rd
#' \name{sbi$bootstrap}
#' \alias{sbi$bootstrap}
#' \alias{sbi_bootstrap}
#' \title{Perform a resampling for the given data set and function}
#' \description{
#'  The function allows you to perform a resampling method without replacement to perform
#'   a boostrap analysis for instance to cmpute a p-value or a confidence interval.
#' }
#' \usage{sbi_bootstrap(x,FUN=NULL,n=1000,...)}
#' \arguments{
#'   \item{x}{a vector, a data frame or a matrix}
#'   \item{FUN}{function handling the given data set type but performing before executing  FUN a sampling with replacement, please note that the function must return a scalar value, default=NULL}
#'   \item{n}{the number of resamplings to perform, default: 1000}
#'   \item{...}{remaining arguments are delegated to the given function *FUN*}
#' }
#' \value{vector with the resampled values from the given function}
#' \examples{
#' rn=rnorm(100,mean=10,sd=2)
#' t.test(rn)$conf.int
#' vals=sbi$bootstrap(rn,FUN=mean)
#' summary(vals)
#' quantile(vals,c(0.025,0.975)) # 95% CI is very close
#' # confidence interval for spearman correlation
#' cor.test(swiss[,1],swiss[,2],method="spearman")
#' vals=sbi$bootstrap(swiss[,c(1,2)],
#'    FUN=function(x) cor(x[,1],x[,2],method="spearman"))
#' summary(vals)
#' quantile(vals,c(0.025,0.975)) # 95% CI shows insignifcant
#' }
#' \seealso{\link[sbi:sbi-package]{sbi-package}}

#' FILE: sbi/R/bootstrap.R
sbi$bootstrap <- function (x,FUN=NULL,n=1000,...) {
    if (class(FUN)!="function") {
        stop("Error: Argument FUN with a function is missing!")
    }
    vals=c()
    for (i in 1:n) {
        if (is.matrix(x) | is.data.frame(x))  {
            idx=sample(1:nrow(x),nrow(x),replace=TRUE)
            vals=c(vals,FUN(x[idx,],...))
        } else {
            idx=sample(1:length(x),length(x),replace=TRUE)
            vals=c(vals,FUN(x[idx],...))
        }
    }
    return(vals)
}

sbi_bootstrap = sbi$bootstrap

#' FILE: sbi/man/sbi_cache_image.Rd
#' \name{sbi$cache_image}
#' \alias{sbi$cache_image}
#' \alias{sbi_cache_image}
#' \title{Create a crc32 image for a downloaded image from the internet if not yet there}
#' \description{The function allows you to cache image files from the internet.}
#' \usage{sbi_cache_image(url,extension="png")}
#' \arguments{
#'   \item{url}{image web url}
#'   \item{extension}{image type, default: "png"}
#' }
#' \value{the local image filename}
#' \examples{
#' url=sbi$cache_image("https://www.plantuml.com/plantuml/png/SoWkIImgAStDuIfEojGBKj2rKyXDBqeio02ohHIAyqkBabEv75BpKe1A0000")
#' url
#' # This can be then embedded into your Markdown document.
#' # like this ![ ](`r url`)
#' }
#' \seealso{\link[sbi:sbi-package]{sbi-package}}
 
#' FILE: sbi/R/cache_image.R
sbi$cache_image <- function (url,extension="png") {
    if (!requireNamespace("digest")) {
        stop("You need to install the digest library")
    } 
    if (!dir.exists("img")) {
        dir.create("img")
    }
    filename=paste(digest::digest(url,"crc32"),".",extension,sep="")
    imgname=file.path("img",filename)
    if (!file.exists(imgname)) {
        utils::download.file(url,imgname)
    }
    return(imgname)
}

sbi_cache_image = sbi$cache_image

#' FILE: sbi/man/sbi_chr2ord.Rd
#' \name{sbi$chr2ord}
#' \alias{sbi$chr2ord}
#' \alias{sbi_chr2ord}
#' \title{Create ordinal numerical variables from character or factor variables}
#' \description{
#' This functions creates ordinal numerical variables out of character or factor variables 
#' based on a given mapping provided as a list.
#' }
#' \usage{sbi_chr2ord(x,map)}
#' \arguments{
#' \item{x}{character or factor vector}
#' \item{map}{list with keys for the given x vector and numbers for the matching values}
#' }
#' \value{numerical values for the mapping}
#' \examples{
#' status=c("never","rare","often","always")
#' x=sample(status,100,replace=TRUE)
#' x=c(NA,x,NA)
#' table(x,useNA='ifany')
#' map=c(never=0, rare=1, often=2,always=3)
#' table(sbi$chr2ord(x,map),useNA='ifany')
#' }
#'
#' \seealso{\link[sbi:sbi-package]{sbi-package}}
#' FILE: sbi/R/chr2ord.R
sbi$chr2ord <- function (x,map) {
    return(unlist(
                  lapply(as.character(x),
                  function(x) {
                         if (is.na(x)) { return(NA) }
                         return(map[[x]])
                  }
                  )))
}
sbi_chr2ord = sbi$chr2ord    

#' FILE: sbi/man/sbi_coa.Rd
#' \name{sbi$coa}
#' \alias{sbi$coa}
#' \alias{sbi_coa}
#' \title{Co-Occurence analysis}
#' \description{
#' The function sbi$cooccur performs a co-occurence analysis.
#'   for small effects, values from 0.5 to 0.8 represent medium effects and values above 0.8 represent large effects. 
#' }
#' \usage{sbi_coa(x)}
#' \arguments{
#' \item{x}{either a data matrix where columns are the variables and rows are the samples or an symmetric matrix which has in the diagonal
#'           the total number of occurence for the variable and in the off-diagonal values
#'           the number how often two variables have a measure together}
#' 
#' }
#' \value{list with the following components:
#'     \item{co.occur}{the co-occurence matrix}
#'     \item{dice}{the dice indices (Dice 1945)}
#'     \item{jaccard}{the Jaccard indeces (Jaccard 1912)}
#'     \item{residuals}{the Pearson residuals}
#'     \item{cohens.w}{the Cohen's w effect size measure (Cohen 1988)}
#'     \item{p.value}{the enrichment p-values of a fisher.test}
#' }
#' \examples{
#' set.seed(123)
#' M=matrix(rbinom(160,1,p=0.025),ncol=8)
#' colnames(M)=LETTERS[1:8]
#' # enrich A/B and C/D and D/E pairs
#' idx=sample(1:20,5)
#' M[idx,c("A","B")]=1
#' idx=sample(1:20,4)
#' M[idx,c("C","D")]=1
#' idx=sample(1:20,3)
#' M[idx,c("D","E")]=1
#' COA=sbi$coa(M)
#' lapply(COA,round, 2)
#' # compare with mutual information
#' round(sbi$mi(M),2)
#' }
#'
#' \seealso{\link[sbi:sbi-package]{sbi-package}}
#' FILE: sbi/R/coa.R

sbi$coa <- function (x) {
    odata=x
    if (is.data.frame(x)) {
        x=as.matrix(x)
    }
    P=matrix(1,ncol=ncol(x),nrow=ncol(x))
    colnames(P)=rownames(P)=colnames(x)
    R=P
    W=P
    W[]=0
    if (!identical(t(x),x)) {
        # not yet a cooccur matrix
        x[x>0]=1
        owarn=options("warn")[[1]]
        options(warn=-1)
        for (i in 1:(ncol(x)-1)) {
            for (j in (i+1):ncol(x)) {
                if (sum(x[,i]) == 0 | sum(x[,j]) ==0) {
                    # sum(x[,i]+x[,j]) == nrow(x)/2
                    P[i,j]=P[j,i]=1
                    R[i,j]=R[j,i]=0
                    W[i,j]=W[j,i]=0
                }  else {
                    P[i,j]=P[j,i]=fisher.test(table(x[,i],x[,j]))$p.value
                    res=chisq.test(table(x[,i],x[,j]))$residuals

                    R[i,j]=R[j,i]=res[2,2]
                    W[i,j]=W[j,i]=sbi$cohensW(table(x[,i],x[,j]))
                }
            }
        }
        options(warn=owarn)
        x=t(x)
        odata=x
        x= x %*% t(x)
    }
    index <- function(x) {
        D=x
        D[]=0
        J=D
        for (i in 1:(nrow(x)-1)) {
            for (j in i:nrow(x)) {
                if (x[i,i]+x[j,j]==0) {
                    D[i,j]=D[j,i]=0
                    J[i,j]=J[j,i]=0
                } else {
                    D[i,j]=D[j,i]=(2*x[i,j])/(x[i,i]+x[j,j])
                    J[i,j]=J[j,i]=x[i,j]/(x[i,i]+x[j,j]-x[i,j])
                }
            }
        }
        return(list(D=D,J=J))
    }
    ind=index(x)
    if (FALSE && !identical(t(odata),odata)) {
        P=NULL
        # does not work
        # randomize cols
        P=ind$D
        P[]=1
        DA=array(0,dim=c(nrow(odata),nrow(odata),10))
        DD=array(0,dim=c(nrow(odata),nrow(odata),10))        
        for (i in 1:10) {
            rdata=odata
            for (j in 1:nrow(rdata)) {
                rdata[j,]=sample(rdata[j,])
            }
            rdata=rdata %*% t(rdata)
            DA[,,i]=rdata
        }
        for (i in 1:(nrow(x)-1)) {
            for (j in (i+1):nrow(x)) {
                if (x[i,j]==0) {
                    pval=1
                } else {
                    pval=t.test(DA[i,j,],mu=x[i,j])$p.value
                }
                P[i,j]=P[j,i]=pval
            }
        }
    }

    return(list(co.occur=x,dice=ind$D,jaccard=ind$J,
                residuals=R,
                cohens.w=W,p.value=P))
}

sbi_coa = sbi$coa

#' FILE: sbi/man/sbi_cohensD.Rd
#' \name{sbi$cohensD}
#' \alias{sbi$cohensD}
#' \alias{sbi_cohensD}
#' \title{Effect size for the difference between two means}
#' \description{
#'   The function cohensD calculates the effect size for the difference between two means.
#'   Due to Cohen's rule of thumb values of around 0.2 are considered to stand 
#'   for small effects, values of around 0.5 represent medium effects and values of around 0.8 
#'   and larger represent large effects. 
#' }
#' \usage{sbi_cohensD(x, y,paired=FALSE)}
#' \arguments{
#' \item{x}{vector with numercial values}
#' \item{y}{vector with two grouping variables, having the same length as x}
#' \item{paired}{are the data paired, default: FALSE}
#' }
#' \details{
#'   Please note that these rules of thumb are not useful for highly dependent outcome 
#'   variables (death for instance) these rules might not be useful and as well lower
#'   values might be of practical relevance.
#' 
#' Alternatively you could use the biserial correlation coefficient `r` as demonstrated in the example below.
#' }
#' \value{Cohen's d value}
#' \examples{
#' cohensD=sbi$cohensD
#' set.seed(125)
#' data(sleep)
#' with(sleep,cohensD(extra,group))
#' x1=rnorm(100,mean=20,sd=1)
#' x2=rnorm(100,mean=22,sd=1)
#' g1=rep('A',100)
#' g2=rep('B',100)
#' # difference should be around 2SD
#' cohensD(c(x1,x2),as.factor(c(g1,g2)))
#' # biseriell correlation coefficient as alternative
#' # value is as well large
#' cor(c(x1,x2),as.numeric(as.factor(c(g1,g2))))
#' }
#' \seealso{\link[sbi:sbi-package]{sbi-package}, \link[sbi:sbi_cohensF]{sbi$cohensF}}
#' FILE: sbi/R/cohensD.R

sbi$cohensD <- function (x, y, paired=FALSE) {
    num=x
    cat=y
    if (paired) {
        tt=t.test(num ~ cat,paired=paired)
        return(tt$statistic[[1]]/sqrt(length(num/2)))
    }   
    tt.agg=aggregate(num,by=list(cat),
        mean,na.rm=TRUE)
    pooledSD <- function(x, y) {
        x=x[!is.na(x)]
        y=y[!is.na(y)]
        sq.devs <- (c(x - mean(x), y - mean(y)))^2
         n <- length(sq.devs)
        return(sqrt(sum(sq.devs)/(n - 2)))
    }
    d=abs(tt.agg$x[1]-tt.agg$x[2])/pooledSD(
        num[cat==levels(cat)[1]],
        num[cat==levels(cat)[2]])
    return(d)
} 
sbi_cohensD = sbi$cohensD

#' FILE: sbi/man/sbi_cohensF.Rd
#' \name{sbi$cohensF}
#' \alias{sbi$cohensF}
#' \alias{sbi_cohensF}
#' \title{Effect size for the difference between three or more means and for a ANOVA}
#' \description{
#'   The function cohensF calculates the effect size for two variables in an Anova.
#'   Due to Cohen's rule of thumb values of around 0.1 are considered to stand 
#'   for small effects, values of around 0.25 represent medium effects and values 
#'   of around 0.4 and above represent large effects. 
#' }
#' \usage{sbi_cohensF(x, y)}
#' \arguments{
#' \item{x}{vector with numercial values}
#' \item{y}{vector with grouping variable, at least three levels, having the same length as x}
#' }
#' \details{
#'   Please note that these rules of thumb are not useful for highly dependent outcome 
#'   variables (death for instance) these rules might not be useful and as well lower
#'   values might be of practical relevance.
#' 
#' }
#' \value{Cohen's F value}
#' \examples{
#' data(iris)
#' sbi$cohensF(iris$Sepal.Width, iris$Species)
#' sbi$cohensF(iris$Sepal.Length, iris$Species)
#' }
#' \seealso{\link[sbi:sbi-package]{sbi-package}, \link[sbi:sbi_cohensD]{sbi$cohensD}}
#' FILE: sbi/R/cohensF.R

sbi$cohensF <- function (x,y) {
    mod=aov(x~y)
    esq=sbi$etaSquared(mod)
    cf=sqrt(esq/(1-esq))
    return(cf[[1]])
}
sbi_cohensF = sbi$cohensF

#' FILE: sbi/man/sbi_cohensH.Rd
#' \name{sbi$cohensH}
#' \alias{sbi$cohensH}
#' \alias{sbi_cohensH}
#' \title{Effect size for 2x2  contingency tables}
#' \description{
#'   The function `sbi$cohensH` calculates the effect size for contingency tables. 
#'   Due to Cohen's rule of thumb values of around 0.2 are considered to stand 
#'   for small effects, values of around 0.5 represent medium effects and values 
#'   around 0.8 or higher represent large effects.
#' }
#' \usage{sbi_cohensH(x)}
#' \arguments{
#' \item{x}{2x2 contingency table with counts, usually created using the table 
#'           command for two variables}
#' }
#' \details{
#'   Please note that these rules of thumb are not useful for highly dependent outcome 
#'   variables (death for instance) these rules might not be useful and as well lower
#'   values might be of practical relevance.
#' }
#' \value{Cohen's h value}
#' \examples{
#' # data from New Eng. J. Med. 329:297-303, 1993
#' azt=as.table(matrix(c(76,399,129,332), byrow=TRUE,ncol=2))
#' rownames(azt)=c("AZT","Placebo")
#' colnames(azt)=c("DiseaseProgress", "NoDiseaseProgress")
#' sbi$cohensH(azt)
#' }
#' \seealso{\link[sbi:sbi-package]{sbi-package}, \link[sbi:sbi_cohensW]{sbi$cohensW}}
#' FILE: sbi/R/cohensH.R


sbi$cohensH <- function (x) {
    pt=prop.test(x)
    h=2*abs(asin(sqrt(pt$estimate[1]))-
        asin(sqrt(pt$estimate[2])))
    return(h[[1]])
}

sbi_cohensH = sbi$cohensH


#' FILE: sbi/man/sbi_cohensW.Rd
#' \name{sbi$cohensW}
#' \alias{sbi$cohensW}
#' \alias{sbi_cohensW}
#' \title{Effect size for 2x2 and larger contingency tables as well as for single variables}
#' \description{
#'   The function `sbi$cohensW` calculates the effect size for contingency tables. 
#'   Due to Cohen's rule of thumb values of around 0.1 are considered to stand 
#'   for small effects, values of around 0.3 represent medium effects and values 
#'   above 0.5 or higher represent large effects.
#' }
#' \usage{sbi_cohensW(x, p=NULL)}
#' \arguments{
#' \item{x}{contingency table with counts, usually created using the table 
#'           command for two variables  or vector with counts with observations
#'           for a single variable, if x is a vector p must be given}
#' \item{p}{expected proportions if x is a vector, in case *x* has length of two,
#'           a single value can be given, otherwise p must have same length as x, default: NULL}
#' }
#' \details{
#'   Please note that these rules of thumb are not useful for highly dependent outcome 
#'   variables (death for instance) these rules might not be useful and as well lower
#'   values might be of practical relevance.
#' }
#' \value{Cohen's w (omega) value}
#' \examples{
#' data(Titanic)
#' Titanic[1,1,,]
#' sbi$cohensW(Titanic[1,1,,])
#' # Data from New Eng. J. Med. 329:297-303, 1993
#' azt=as.table(matrix(c(76,399,129,332), byrow=TRUE,ncol=2))
#' rownames(azt)=c("AZT","Placebo")
#' colnames(azt)=c("DiseaseProgress", "NoDiseaseProgress")
#' sbi$cohensW(azt)
#' # number of boys (25) and girls (15) in a hospital which deviates 
#' # from 50/50 or 51/49 ratios
#' prop.table(c(25,15))
#' (prop.table(c(25,15))-0.5)*2
#' sbi$cohensW(c(25,15),p=0.5)
#' sbi$cohensW(c(25,15),p=c(0.51,0.49))
#' # most extrem case 40 boys and 0 girls
#' sbi$cohensW(c(40,0),p=0.5)
#' sbi$cohensW(c(40,0),p=c(0.51,0.49)) # max value here around 2*0.49
#' }
#' \seealso{\link[sbi:sbi-package]{sbi-package}, \link[sbi:sbi_cohensW]{sbi$cohensW}}
#' FILE: sbi/R/cohensW.R

sbi$cohensW <- function (x,p=NULL) {
    if (is.table(x) | is.matrix(x)) {
        tab=x
        pe=prop.table(chisq.test(tab)$expected)
        po=prop.table(tab)
        w=sqrt(sum(((po-pe)^2)/pe))
        return(w[[1]])
    } else if (is.null(p)) {
        stop('Error: If x is a vector, p must be given!')
    } else {
        if (length(x) == 2 & length(p) == 1) {
            p=c(p,1-p)
            po=prop.table(x)
            pe=p
        } else if  (length(x) == length(p)) {
            po=prop.table(x)
            pe=p
        } else {
            stop('Error: for more than 2 categories the
                 given proportion vector p must have the
                 same length as the given count vector x')
        }
        w = sqrt(sum(((po-pe)^2)/pe))
        return(w)
    }
}

sbi_cohensW = sbi$cohensW

#' FILE: sbi/man/sbi_corplot.Rd
#' \name{sbi$corplot}
#' \title{Correlation plot with a Regression line}
#' \alias{sbi$corplot}
#' \alias{sbi_corplot}
#' \description{Visualize a correlation with a regression line using the abline function.}
#' \usage{sbi_corplot(x, y, col = 'red', pch = 19, cex=2, method = "pearson", ...)}
#' \arguments{
#'   \item{x}{numerical vector}
#'   \item{y}{numerical vector}
#'   \item{col}{plotting character color, default: 'red'}
#'   \item{pch}{the plotting symbol for the correlations, default: 19}
#'   \item{cex}{the character expansion, default: 2}
#'   \item{method}{the correlation method, 'pearson', 'spearman', or 'kendall', default: 'pearson'}
#'   \item{...}{additional arguments passed to the plot function}
#' }
#' \details{
#'   This function generates a scatter plot of two variables and displays the best-fit line (abline) for their correlation.
#' }
#' \examples{
#' data(swiss)
#' sbi$corplot(swiss$Fertility, swiss$Agriculture, xlab = "Fertility", ylab = "Agriculture")
#' }
#' \seealso{\link[sbi:sbi-package]{sbi-package}}

#' FILE: sbi/R/corplot.R
sbi$corplot <- function (x, y, col = 'red', pch = 19, cex = 2, method = "pearson", ...) {
   p = cor.test(x, y, method = method, use = "complete.obs")$p.value
   star = sbi$report_pval(p, star = TRUE)
   r = paste('r = ', round(cor(x, y, method = method, use = "complete.obs"), 2), star, sep = "")
   plot(x ~ y, main = r, col = col, pch = pch, cex = cex, ...)
   abline(lm(x ~ y), col = col, lwd = 2)
   box()
}

sbi_corplot = sbi$corplot


#' FILE: sbi/man/sbi_corrplot.Rd
#' \name{sbi$corrplot}
#' \alias{sbi$corrplot}
#' \alias{sbi_corrplot}
#' \title{Visualize a Correlation matrix}
#' \description{Visualize a correlation matrix.}
#' \usage{sbi_corrplot(mt, text.lower = TRUE, text.upper = FALSE, 
#'          pch = 19, p.mat = NULL, alpha = 0.05, cex.sym = 5, 
#'          cex.r = 1, cex.lab = 1.4, ...)
#' }
#' \arguments{
#'   \item{mt}{matrix with pairwise correlations}
#'   \item{text.lower}{should the correlation coefficient be shown in the lower diagonal, default: TRUE}
#'   \item{text.upper}{should the correlation coefficient be shown in the upper diagonal, default: FALSE}
#'   \item{pch}{the plotting symbol for the correlations, default: 19}
#'   \item{p.mat}{matrix with p-values to strike out insignificant correlations, default: NULL}
#'   \item{alpha}{significance threshold for p.mat, default: 0.05}
#'   \item{cex.sym}{character expansion for the correlation symbols, default: 5}
#'   \item{cex.r}{character expansion for the r-values if text.lower or text.upper is set to TRUE, default: 1}
#'   \item{cex.lab}{character expansion for the variable text labels, default: 1.4}
#'   \item{...}{additional arguments passed to the plot function}
#' }
#' \details{
#' This function creates a graphical representation of a correlation matrix with symbols and text showing the strength of correlations.
#' }
#' \value{A graphical visualization of the correlation matrix.}
#' \examples{ %options: fig.width=8,fig.height=6
#' data(swiss)
#' sw = swiss
#' colnames(sw) = abbreviate(colnames(swiss), 5)
#' cr = sbi$corr(sw, method = 'spearman')
#' par(mai=c(0.3,0.3,0.3,0.1))
#' sbi$corrplot(cr$estimate, cex.sym = 6, cex.lab=1.2,
#'  text.lower = TRUE, cex.r = 1.2, p.mat = cr$p.value)
#' }
#' \seealso{\link[sbi:sbi-package]{sbi-package}}
#' FILE: sbi/R/corrplot.R
sbi$corrplot <- function (mt, text.lower = TRUE, text.upper = FALSE, pch = 19, p.mat = NULL, alpha = 0.05, cex.sym = 5, cex.r = 1, cex.lab = 1.4, ...) {
  if (class(p.mat)[1] == 'NULL') {
    p.mat = mt
    p.mat[] = 0
  }
  yend = nrow(mt) + 1
  xend = ncol(mt) + 1
  plot(1, type = "n", xlab = "", ylab = "", axes = FALSE, xlim = c(0, xend), ylim = c(nrow(mt), 0), ...)
  text(1:(ncol(mt)), 0.25, colnames(mt), cex = cex.lab)
  text(0, 1:nrow(mt), rownames(mt), cex = cex.lab, pos = 4)
  cols = paste("#DD3333", rev(c(15, 30, 45, 60, 75, 90, "AA", "BB", "CC", "DD")), sep = "")
  cols = c(cols, paste("#3333DD", c(15, 30, 45, 60, 75, 90, "AA", "BB", "CC", "DD"), sep = ""))
  breaks = seq(-1, 1, by = 0.1)
  sym = identical(rownames(mt), colnames(mt))
  for (i in 1:nrow(mt)) {
    for (j in 1:nrow(mt)) {
      if (sym & i == j) {
        next
      }
      coli = cut(mt[i, j], breaks = breaks, labels = 1:20)
      if (i == j & !sym & text.lower) {
        text(i, j, round(mt[i, j], 2), cex = cex.r)
        if (p.mat[i, j] > alpha) {
          text(i, j, "x", cex = cex.r * 2)
        }
      } else if (i < j & text.lower) {
        text(i, j, round(mt[i, j], 2), cex = cex.r)
        if (p.mat[i, j] > alpha) {
          text(i, j, "x", cex = cex.r * 2)
        }
      } else if (i > j & text.upper) {
        text(i, j, round(mt[i, j], 2), cex = cex.r)
        if (p.mat[i, j] > alpha) {
          text(i, j, "x", cex = cex.r * 2)
        }
      } else {
        points(i, j, pch = pch, cex = cex.sym, col = cols[coli])
        if (p.mat[i, j] > alpha) {
          text(i, j, "x", cex = cex.sym * 0.3)
        }
      }
    }
  }
}

sbi_corrplot = sbi$corrplot

#' FILE: sbi/man/sbi_corvar.Rd
#' \name{sbi$corvar}
#' \alias{sbi$corvar}
#' \alias{sbi_corvar}
#' \title{Create a Vector with a given Correlation to an other Vector}
#' \description{
#'   The function `sbi$corvar` can be used to create sample data following a certain
#'   correlation structure. This might be helpful for illustration purposes or to evaluate
#' }
#' \usage{sbi_corvar(x,r,mean=0,sd=1)}
#' \arguments{
#'   \item{x}{vector with numerical values}
#'   \item{r}{correlation value , must between -1 and 1}
#'   \item{mean}{mean for the requested data vector, default: 0}
#'   \item{sd}{standard deviation for the requested data vector, default: 1}
#' }
#' \value{numerical vector having the requested pearson correlation to `x`}
#' \examples{
#' set.seed(123)
#' A=rnorm(300,mean=160,sd=6)
#' B=sbi$corvar(A,r=0.7,mean=80,sd=4)
#' C=sbi$corvar(A,r=0.5,mean=40,sd=2)
#' D=sbi$corvar(B,r=0.4,mean=18,sd=1)
#' E=sbi$corvar(D,r=0.4,mean=30,sd=1)
#' df=data.frame(A=A,B=B,C=C,D=D,E=E)
#' summary(df)
#' round(cor(df),2)
#' }
#' \seealso{\link[sbi:sbi-package]{sbi-package}, \link[sbi:sbi_corvars]{sbi$corvars}}
#' FILE: sbi/R/corvar.R

sbi$corvar <- function (x,r,mean=0,sd=1) {
    mu2=mean
    y = stats::rnorm(length(x),mean=mu2,sd=sd)
    d <- data.frame(x = x, y = y)   
    corr <- r  # target correlation
    corr_mat <- matrix(corr, ncol = 2, nrow = 2)
    diag(corr_mat) <- 1
    mvdat <- MASS::mvrnorm(n = nrow(d), mu = c(0, 0), 
     Sigma = corr_mat, empirical = TRUE)  
    rx <- rank(mvdat[ , 1], ties.method = "first")
    ry <- rank(mvdat[ , 2], ties.method = "first")
    dx_sorted <- sort(d$x)
    dy_sorted <- sort(d$y)
    dvx=dx_sorted[rx]
    dvy=dy_sorted[ry]
    dvx2=x
    dvy2=dvy[order(dvx)]
    dvy2=dvy2[rank(dvx2,ties.method='random')]
    return(dvy2)
}   

sbi_corvar = sbi$corvar

#' FILE: sbi/man/sbi_corvars.Rd
#' \name{sbi$corvars}
#' \alias{sbi$corvars}
#' \alias{sbi_corvars}
#' \title{Create a Data frame with a given Correlation structure}
#' \description{
#'   The function `sbi$corvars` can be used to create sample data following a certain
#'   correlation structure. This might be helpful for illustration purposes or to evaluate
#' }
#' \usage{sbi_corvars(n,r.matrix,mu.vec)}
#' \arguments{
#'   \item{n}{number of values for each variable}
#'   \item{r.matrix}{matrix of correlation values, must be symmetric}
#'   \item{mu.vec}{means for the values of each variable, default: 0}
#' }
#' \value{data frame with `n` rows and `ncol(r.matrix)` columns}
#' \examples{
#' set.seed(123)
#' r.mt=matrix(c(1,0.7,0.4, 0.7,1,0.3, 0.4,0.3,1),
#'      byrow=TRUE,ncol=3)
#' mt.vars=sbi$corvars(100,r.mt,c(1,10,5))
#' summary(mt.vars)
#' cor(mt.vars)
#' }
#' \seealso{\link[sbi:sbi-package]{sbi-package}, \link[sbi:sbi_corvar]{sbi$corvar}}
#' FILE: sbi/R/corvars.R

sbi$corvars = function (n,r.matrix,mu.vec) {
    samples = n
    data = MASS::mvrnorm(n, mu=mu.vec, Sigma=r.matrix,
                   empirical=TRUE)
    return(data)
}

sbi_corvars = sbi$corvars


#' FILE: sbi/man/sbi_cramersV.Rd
#' \name{sbi$cramersV}
#' \alias{sbi$cramersV}
#' \alias{sbi_cramersV}
#' \title{Effect size for 2x2 and larger contingency tables}
#' \description{
#'   Calculate the effect size for contingency tables. 
#'   For 2x2 tables (df = 1), values of around 0.1 represent small effects, 0.3 medium effects, 
#'   and 0.5 or higher large effects. For tables with more categories (e.g., 3x3), 
#'   the thresholds are 0.07, 0.21, and 0.35.
#' }
#' \usage{sbi_cramersV(tab, correct = TRUE)}
#' \arguments{
#'   \item{tab}{A contingency table with counts, typically created using the \code{table} command for two variables.}
#'   \item{correct}{should Yates correction being applied, default: TRUE}
#' }
#' \value{Cramer's V value.}
#' \examples{
#' data(Titanic)
#' Titanic[1,1,,]
#' sbi$cramersV(Titanic[1,1,,])
#' azt = as.table(matrix(c(76, 399, 129, 332), byrow=TRUE, ncol=2))
#' rownames(azt) = c("AZT", "Placebo")
#' colnames(azt) = c("DiseaseProgress", "NoDiseaseProgress")
#' sbi$cramersV(azt)
#' }
#' \seealso{\link[sbi:sbi_cohensW]{sbi$cohensW}}
#' FILE: sbi/R/cramersV.R
sbi$cramersV <- function (tab, correct = TRUE) {
  owarn = options("warn")[[1]]
  options(warn = -1)
  t = min(dim(tab))
  val = sqrt(chisq.test(tab, correct = correct)$statistic / (sum(tab) * (t - 1)))[[1]]
  options(warn = owarn)
  return(val)
}
sbi_cramersV = sbi$cramersV

#' FILE: sbi/man/sbi_cv.Rd
#' \name{sbi$cv}
#' \alias{sbi$cv}
#' \alias{sbi_cv}
#' \title{Calculate the coefficient of variation}
#' \description{
#'   Calculate the coefficient of variation, which is the ratio of the standard
#'   deviation to the mean.
#' }
#' \usage{sbi_cv(x, na.rm = FALSE)}
#' \arguments{
#'   \item{x}{A numeric vector with positive values.}
#'   \item{na.rm}{Logical; if TRUE, NA values will be removed. Default is FALSE.}
#' }
#' \value{The coefficient of variation (CV).}
#' \examples{
#' cv = sbi$cv
#' cv(rnorm(20, mean = 100, sd = 4))
#' cv(c(1, 2, 3, 4))
#' cv(c(1, 2, 3, 4, NA))
#' cv(c(1, 2, 3, 4, NA), na.rm = TRUE)
#' }
#' \seealso{\link[sbi:sbi_cv]{sbi$sv}}

#' FILE: sbi/R/cv.R
sbi$cv <- function (x, na.rm = FALSE) {
  cv = 100 * sd(x, na.rm = na.rm) / mean(x, na.rm = na.rm)
  return(cv)
}
sbi_cv = sbi$cv

#' FILE: sbi/man/sbi_df2md.Rd
#' \name{sbi$df2md}
#' \alias{sbi$df2md}
#' \alias{sbi_df2md}
#' \title{Convert a Data frame or a Matrix into a Markdown table}
#' \description{Converts a data frame or a matrix into a Markdown table.}
#' \usage{sbi_df2md(x, caption = '', rownames = TRUE)}
#' \arguments{
#'   \item{x}{matrix or data frame to convert.}
#'   \item{rownames}{logical; should the row names be included in the output, default: TRUE.}
#'   \item{caption}{optional character string for the table caption.}
#' }
#' \details{
#' This function is used to convert a data frame or matrix into a Markdown table, 
#' which can be directly rendered in RMarkdown documents. For more advanced usage, 
#' consider using packages like \code{kable} from the knitr package.
#' }
#' \value{The function outputs a Markdown table to stdout.}
#' \examples{ %options: results="asis"
#' data(swiss)
#' sbi$df2md(head(swiss))
#' }
#' \seealso{\link[sbi:sbi-package]{sbi-package}}
#' FILE: sbi/R/df2md.R
sbi$df2md <- function (x, caption = '', rownames = TRUE) {
  df <- x
  cn <- colnames(df)
  if (is.null(cn[1])) {
    cn <- as.character(1:ncol(df))
  }
  rn <- rownames(df)
  if (is.null(rn[1])) {
    rn <- as.character(1:nrow(df))
  }
  if (rownames) {
    headr <- paste0(c("| ", cn), sep = "|", collapse = '')
    sepr <- paste0(c('|', rep(paste0(c(rep('-', 3), "|"), collapse = ''), length(cn) + 1)), collapse = '')
  } else {
    headr <- paste0(c("| ", cn), sep = "|", collapse = '')
    sepr <- paste0(c('|', rep(paste0(c(rep('-', 3), "|"), collapse = ''), length(cn))), collapse = '')
  }
  st <- "|"
  for (i in 1:nrow(df)) {
    if (rownames) {
      st <- paste0(st, "**", as.character(rn[i]), "**|", collapse = '')
    }
    for (j in 1:ncol(df)) {
      if (j %% ncol(df) == 0) {
        st <- paste0(st, as.character(df[i, j]), "|", "\n", "|", collapse = '')
      } else {
        st <- paste0(st, as.character(df[i, j]), "|", collapse = '')
      }
    }
  }
  fin <- paste0(c(headr, sepr, substr(st, 1, nchar(st) - 1)), collapse = "\n")
  if (caption != '') {
    fin <- paste0(fin, '\n', caption, '\n')
  }
  cat(fin)
}

sbi_df2md = sbi$df2md

#' FILE: sbi/man/sbi_dict.Rd
#' \name{sbi$dict}
#' \alias{sbi$dict}
#' \alias{sbi_dict}
#' \title{Create list with unique Keys and Values - a Dictionary}
#' \description{Creates a key-value list, ensuring the keys are unique.}
#' \usage{sbi_dict(...)}
#' \arguments{
#'   \item{...}{key-value pairs to create a dictionary.}
#' }
#' \details{
#' This function creates a dictionary-like object in R using key-value pairs, where each key must be unique.
#' }
#' \value{A named list with unique keys.}
#' \examples{
#' options(error = print)
#' # Standard list allows duplicates:
#' l = list(a = 1, a = 2)
#' l$a
#' l[1]
#' l[2]
#' 
#' # Dictionary will not allow duplicates:
#' try({d = sbi$dict(a = 1, a = 1)})
#' d = sbi$dict(a = 1, b = 2)
#' d
#' sbi$is.dict(d)
#' options(error = NULL)
#' }
#' \seealso{\link[sbi:sbi-package]{sbi-package}}
#' FILE: sbi/R/dict.R
sbi$dict <- function (...) {
  l <- list(...)
  if (!sbi$is.dict(l)) {
    stop('Error: dict must have key-value pairs and keys cannot be duplicated!')
  }
  return(l)
}


sbi_dict = sbi$dict

#' FILE: sbi/man/sbi_dpairs.Rd
#' \name{sbi$dpairs}
#' \alias{sbi$dpairs}
#' \alias{sbi_dpairs}
#' \title{Improved Pairs plot considering the Data types}
#' \description{
#'   The function `dpairs` provides an improved pairs plot which accounts
#'   for the data type of the actual variables. It will plot in the 
#'   lower diagonal xy-plots, box-plots or assoc-plots depending on the 
#'   two data types. In the upper diagonal effect sizes and stars for the p-values
#'   for the tests (anova, t.test, chisq.test or cor.test will be shown. In the diagonal 
#'   the data distribution will be outlined. This plot is usually an useful visualization
#'   for 3-8 variables.
#' }
#' \usage{sbi_dpairs(data,col.box='grey80', col.xy="grey60", 
#'     cex.diag=2.5, order=TRUE,pch=19)}
#' \arguments{
#'   \item{data}{data frame with columns of class factor, numeric or integer}
#'   \item{col.box}{colors for the boxplots, either a single value or a vector of colors for each
#'      level of a factor variable, default: 'grey80'}
#'   \item{col.xy}{colors for the xy-plots, either a single value of a vector which is as long as
#'      the number of data points, default: 'grey60'}
#'   \item{cex.diag}{character expansion for the diagonal texts}
#'   \item{order}{should the variables be ordered by data type and name, this is recommended
#'      as it orders the plots, starting with assocplots, then boxplots and finally xyplots, default: TRUE}
#'   \item{pch}{plotting character for xy-plots, default 19 (round circle)}
#' }
#' \examples{ %options: fig.width=12,fig.height=12
#' data(iris)
#' dpairs=sbi$dpairs
#' par(omi = c(0.8, 0.4,0.4,0.4))
#' dpairs(iris,col.box=2:4,col.xy=rep(c(2:4),each=50),
#'   cex.diag=1.6)
#' sbi$dpairs_legend(levels(iris$Species),col=2:4,cex=1)
#' par(omi=c(0.5,0.5,0.8,0.2))
#' btwt=MASS::birthwt; 
#' for (col in c('low','race','smoke','ptl','ht','ui','ftv')) { 
#'    btwt[,col]=as.factor(btwt[,col]) 
#'  }
#' dpairs(btwt[,2:8],cex.diag=1.6)
#' mtext('Birth-Weight data',side=3,outer=TRUE,cex=1.5,line=1)
#' }
#' \seealso{\link[sbi:sbi-package]{sbi-package}, \link[sbi:sbi_dpairs_legend]{sbi$spairs_legend}}
#' FILE: sbi/R/dpairs.R

sbi$dpairs <- function (data,col.box='grey80',col.xy="grey60",cex.diag=2.5,
                    order=TRUE,pch=19) {
    oop=options()
    opar=par()
    options(warn=-1)
    attach(sbi)
    if (any(class(data) %in% "tbl_df")) {
        data=as.data.frame(data)
    }
    if (order) {
        data=data[,sort(colnames(data))]
        res=c(); for (i in 1:ncol(data)) { res=c(res,class(data[,i])) }
        idx=order(res)
        data=data[,idx]
    }
    mai=rep(0.0,4)
    par(mfrow=c(ncol(data),ncol(data)),mai=mai)
    cnames=colnames(data)
    for (i in 1:ncol(data)) {
        for (j in 1:ncol(data)) {
            if (i == j) {
                plot(1,type='n',xlab='',ylab='',axes=FALSE,xlim=c(0,1),ylim=c(0,1))
                text(0.5,0.5,cnames[i],cex=cex.diag)
                par(mai=rep(0,4))
                box(lty=3,col='grey70')
                if (class(data[,i]) == "factor") {
                    rect(0.1,0.1,0.9,0.3,col="grey90")
                    for (ci in cumsum(prop.table(table(data[,i])))) {
                        x=0.1+0.8*ci
                        lines(x=c(x,x),y=c(0.1,0.3))
                    }
                }
                if (class(data[,i]) %in% c("numeric","integer")) {
                    ds=density(data[,i],na.rm=TRUE)
                    ds$x=ds$x-min(ds$x)
                    ds$x=ds$x/max(ds$x)
                    ds$y=(ds$y/max(ds$y)*0.3)
                    polygon(ds,col='grey80')
                }
                par(mai=mai)
            } else if (i > j) {
                if (class(data[,i]) %in% c("numeric","integer") & class(data[,j]) %in% c("numeric","integer")) {
                    plot(data[,i] ~ data[,j],xlab='',ylab='',axes=FALSE,pch=pch,
                         col=col.xy)
                    box(col='grey70')
                    if (j+1 == i) {
                        #axis(3)
                        #axis(4)
                    }
                    if (j == 1) {
                        axis(2)
                    }
                    if (i == ncol(data)) {
                        ticks=axTicks(1) 
                        axis(1,at=ticks[1:(length(ticks)-1)],labels=ticks[1:(length(ticks)-1)],col='grey70')
                    }
                } else if (class(data[,i]) == "factor" & class(data[,j]) == "factor") {
                    par(mai=rep(0.3,4))
                    sbi$assoc(t(table(data[,i],data[,j])))
                    par(mai=rep(0,4))
                    box(lty=3,col='grey70')
                    par(mai=mai)
                } else if (class(data[,i]) %in% c("numeric","integer")) {
                    boxplot(data[,i] ~ data[,j],col=col.box,axes=FALSE)
                    if (j+1 == i) {
                        #axis(3,at=1:length(levels(data[,j])),labels=levels(data[,j]))
                        #axis(4)
                    } 
                    if (j == 1) {
                        ticks=axTicks(2) 
                        axis(2,at=ticks[1:(length(ticks)-1)],labels=ticks[1:(length(ticks)-1)],col='grey70')
                    }
                    if (i == ncol(data)) {
                        axis(1,at=1:length(levels(data[,j])),labels=levels(data[,j]),col="grey70")
                    }

                    box(col="grey70")
                } else if (class(data[,j]) %in% c("numeric","integer")) {
                    boxplot(data[,j] ~ data[,i],col=col.box,axes=FALSE)
                    if (j == 1) {
                        axis(2)
                    }
                    if (i == ncol(data)) {
                        axis(1,at=1:length(levels(data[,j])),labels=levels(data[,j]))
                    }
                    box()

                } 
            } else {
                if (class(data[,i]) %in% c("numeric","integer") & class(data[,j]) %in% c("numeric","integer")) {
                    r=cor.test(data[,i],data[,j])
                    rs=cor.test(data[,i],data[,j],method='spearman')
                    plot(1,type='n',xlab='',ylab='',axes=FALSE,xlim=c(0,1),ylim=c(0,1))
                    text(0.5,0.59,bquote("" ~ r[P] ~ .(sprintf(" = %.2f%s",r$estimate,sbi$report_pval(r$p.value,star=TRUE)))),cex=1.5)
                    text(0.5,0.41,bquote("" ~ r[S] ~ .(sprintf(" = %.2f%s",rs$estimate,sbi$report_pval(rs$p.value,star=TRUE)))),cex=1.5)
                } else if (class(data[,i]) == "factor" & class(data[,j]) == "factor") {
                    cw=sbi$cohensW(table(data[,i],data[,j]))
                    chsq=chisq.test(table(data[,i],data[,j]))
                    plot(1,type='n',xlab='',ylab='',axes=FALSE,xlim=c(0,1),ylim=c(0,1))
                    text(0.5,0.5,sprintf("Cohen's w =\n%.2f %s",cw,sbi$report_pval(chsq$p.value,star=TRUE)),cex=1.5)
                    
                } else if (class(data[,i]) %in% c("numeric","integer")) {
                    if (length(levels(data[,j]))==2) {
                        tt=t.test(data[,i] ~ data[,j]) 
                        cd=sbi$cohensD(data[,i],data[,j])
                        plot(1,type='n',xlab='',ylab='',axes=FALSE,xlim=c(0,1),ylim=c(0,1))
                        text(0.5,0.5,sprintf("Cohen's d =\n%.2f %s",cd,sbi$report_pval(tt$p.value,star=TRUE)),cex=1.5)
                    } else {
                        raov=aov(data[,i] ~ data[,j]) 
                        #recover()
                        rs=sbi$etaSquared(raov)
                        pval=sbi$report_pval(summary(raov)[[1]][1,5],star=TRUE)
                        plot(1,type='n',xlab='',ylab='',axes=FALSE,xlim=c(0,1),ylim=c(0,1))
                        text(0.5,0.5,bquote(eta~2~sprintf(" = %.2f %s",rs,pval)),cex=1.5)
                    }
                } else if (class(data[,j]) %in% c("numeric","integer")) {
                    if (length(levels(data[,i]))==2) {
                        tt=t.test(data[,j] ~ data[,i]) 
                        cd=sbi$cohensD(data[,j],data[,i])
                        plot(1,type='n',xlab='',ylab='',axes=FALSE,xlim=c(0,1),ylim=c(0,1))
                        text(0.5,0.5,sprintf("Cohen's d =\n%.2f %s",cd,sbi$report_pval(tt$p.value,star=TRUE)),cex=1.5)
                    } else {
                        raov=aov(data[,j] ~ data[,i]) 
                        rs=sbi$etaSquared(raov)
                        pval=sbi$report_pval(summary(raov)[[1]][1,5],star=TRUE)
                        plot(1,type='n',xlab='',ylab='',axes=FALSE,xlim=c(0,1),ylim=c(0,1))
                        val=sprintf("%.2f %s",rs,pval)
                        text(0.5,0.5,bquote("" ~ eta^2 ~ " = " ~ .(val)),cex=1.5)
                    }
                } 
                par(mai=rep(0,4))
                box(lty=3,col='grey70')
                par(mai=mai)
            }
        }
    }
    detach(sbi)
    par(opar)    
    options(oop)

}
sbi_dpairs = sbi$dpairs

#' FILE: sbi/man/sbi_dpairs_legend.Rd
#' \name{sbi$dpairs_legend}
#' \alias{sbi$dpairs_legend}
#' \alias{sbi_dpairs_legend}
#' \title{Adding legend top or bottom to a `sbi$dpairs` or the standard `pairs` plot}
#' \description{
#'   The function `sbi$dpairs_legend` allows the user to place a legend outside of a 
#'   pairs or dpairs plot.}
#' \usage{sbi_dpairs_legend(labels,col='grey80',pch=15,side="bottom",cex=2)}
#' \arguments{
#'   \item{labels}{txt labels to be plotted}
#'   \item{col}{colors for the plotting characters}
#'   \item{pch}{plotting symbol, default: 15}
#'   \item{side}{where to place the legend, 'top' or 'bottom', default: 'bottom'}
#'   \item{cex}{the character expansion for the legend, default: 2}
#' }
#' \examples{
#' data(iris)
#' par(omi = c(0.8, 0.4,0.8,0.4)) # reserve some space top and bottom
#' sbi$dpairs(iris,col.box=2:4,col.xy=rep(c(2:4),each=50))
#' sbi$dpairs_legend(levels(iris$Species),col=2:4)
#' mtext('Iris Data',side=3,outer=TRUE,cex=2,line=1)
#' }
#' \seealso{\link[sbi:sbi-package]{sbi-package}, \link[sbi:sbi_dpairs]{sbi$spairs}}
#' FILE: sbi/R/dpairs_legend.R

sbi$dpairs_legend <- function (labels,col='grey80',pch=15,side="bottom",cex=2) {
    opar=par()
    options(warn=-1)
    par(fig = c(0, 1, 0, 1), oma = c(0, 0, 0, 0), mar = c(0, 0, 0, 0), new = TRUE)
    plot(0, 0, type = "n", bty = "n", xaxt = "n", yaxt = "n")
    legend(side, labels, xpd = TRUE, horiz = TRUE, inset = c(0,0), 
           bty = "n", pch = pch, col = col, cex = cex)
    par(opar)
}
sbi_dpairs_legend = sbi$dpairs_legend


#' FILE: sbi/man/sbi_drop_na.Rd
#' \name{sbi$drop_na}
#' \alias{sbi$drop_na}
#' \alias{sbi_drop_na}
#' \title{Removes all Rows where any of the given columns contain a NA}
#' \description{
#'    More sophisticated then `na.omit`. In contrast to this method, `sbi$drop_na` just
#'    checks the given columns to delete rows which have any NA in these two columns in the given rows. 
#'    This mimics the `tidyr::drop_na` function.
#' }
#' \usage{sbi_drop_na(x,cols)}
#' \arguments{
#'   \item{x}{data frame or matrix}
#'   \item{cols}{columns to check for NA's}
#' }
#' \examples{
#' data(iris)
#' ir=iris
#' ir[c(1,3),1]=NA
#' ir[2,2]=NA
#' ir[4,4]=NA
#' head(ir)
#' head(na.omit(ir)) # removes all rows with an NA somewhere
#' head(sbi$drop_na(ir,1:2)) # just checks the first two columns
#' }
#' \seealso{\link[sbi:sbi-package]{sbi-package}}
#' FILE: sbi/R/drop_na.R

sbi$drop_na <- function (x,cols) { 
    idx=which(apply(!is.na(x[,cols]),1,all)); return(x[idx,]) 
} 
sbi_drop_na = sbi$drop_na

#' FILE: sbi/man/sbi_epsilonSquared.Rd
#' \name{sbi$epsilonSquared}
#' \alias{sbi$epsilonSquared}
#' \alias{sbi_epsilonSquared}
#' \title{Calculate the Effect size Epsilon-squared for Variables of a Kruskal test}
#' \description{Calculate the epsilon-squared effect size for Kruskal-Wallis tests.}
#' \usage{sbi_epsilonSquared(x, y = NULL)}
#' \arguments{
#'   \item{x}{a vector with numerical values or a linear model or an aov object.}
#'   \item{y}{a vector with factor values or a second numerical variable, or NULL if \code{x} is a model.}
#' }
#' \details{
#'   The function calculates the epsilon-squared value as a measure of effect size for Kruskal-Wallis tests. 
#'   Cohen's rule of thumb is 0.01-0.09 (small), 0.09-0.25 (medium), and above 0.25 (large).
#' }
#' \value{Returns the epsilon-squared value for the given variables.}
#' \examples{
#' data(iris)
#' sbi$epsilonSquared(iris$Sepal.Length, iris$Species)
#' data(ToothGrowth)
#' sbi$epsilonSquared(ToothGrowth$len, as.factor(ToothGrowth$dose))
#' cor(ToothGrowth$len, ToothGrowth$dose, method="spearman")^2
#' }
#' \seealso{\link[sbi:sbi-package]{sbi-package}, \link[sbi:sbi_etaSquared]{sbi$etaSquared}}
#' FILE: sbi/R/epsilonSquared.R
sbi$epsilonSquared <- function (x, y = NULL) {
  if (class(y) %in% c("numeric", "integer")) {
    H = unname(kruskal.test(list(x, y))$statistic)
    n = length(x[which(!is.na(x) & !is.na(y))])
  } else {
    H = unname(kruskal.test(x ~ y)$statistic)
    n = sum(table(x, y))  # Remove NAs
  }
  es = H / ((n^2 - 1) / (n + 1))
  return(unlist(es))
}

sbi_epsilonSquared = sbi$epsilonSquared

#' FILE: sbi/man/sbi_etaSquared.Rd
#' \name{sbi$etaSquared}
#' \alias{sbi$etaSquared}
#' \alias{sbi_etaSquared}
#' \title{Calculate the Effect size Eta-squared for an Anova or a Linear model}
#' \description{Calculate the eta-squared effect size for ANOVA or linear models.}
#' \usage{sbi_etaSquared(x, y = NULL)}
#' \arguments{
#'   \item{x}{a vector with numerical values or a linear model or an aov object.}
#'   \item{y}{either a factor or NULL if \code{x} is given as a model.}
#' }
#' \details{
#'   The function calculates the eta-squared value, which can be used to interpret effect size in ANOVA or linear models. Cohen's rule of thumb is 0.01-0.09 (small), 0.09-0.25 (medium), and above 0.25 (large).
#' }
#' \value{Returns the eta-squared value for the given variables or model.}
#' \examples{
#' data(iris)
#' sbi$etaSquared(iris$Sepal.Length, iris$Species)
#' sbi$etaSquared(lm(iris$Sepal.Length ~ iris$Species))
#' sbi$etaSquared(aov(iris$Sepal.Length ~ iris$Species))
#' }
#' \seealso{\link[sbi:sbi-package]{sbi-package}, \link[sbi:sbi_epsilonSquared]{sbi$epsilonSquared}}
#' FILE: sbi/R/etaSquared.R
sbi$etaSquared <- function (x, y = NULL) {
  if (class(x)[1] == "lm") {
    mod = x
    if (length(attr(mod$terms, "dataClasses")) == 2) {
      return(summary(mod)$r.squared)
    } else {
      class(x) = "aov"
      return(sbi$etaSquared(x))
    }
  } else if (class(x)[1] == "aov") {
    mod = x
    ss = sum(summary(mod)[[1]][, 2])
    sq = summary(mod)[[1]][, 2] / ss
    names(sq) = rownames(summary(mod)[[1]])
    sq = sq[1:(length(sq) - 1)]
    return(sq)
  } else if (class(x)[1] == "numeric" & class(y)[1] == "factor") {
    mod = aov(x ~ y)
    return(as.vector((sbi$etaSquared(mod))))
  } else {
    stop("Error: wrong call of 'etaSquared'! Call either 'sbi$etaSquared(num, factor)' or with 'sbi$etaSquared(lm(num ~ factor))'!")
  }
}

sbi_etaSquared = sbi$etaSquared

#' FILE: sbi/man/sbi_deg2rad.Rd
#' \name{sbi$deg2rad}
#' \alias{sbi$deg2rad}
#' \alias{sbi_deg2rad}
#' \title{Convert Angle in Degrees to Radians}
#' \description{Convert an angle from degrees to radians.}
#' \usage{sbi_deg2rad(x)}
#' \arguments{
#'   \item{x}{Angle in degrees.}
#' }
#' \value{The angle converted to radians.}
#' \examples{
#' sbi$deg2rad(180)  # Returns pi radians
#' sbi$rad2deg(sbi$deg2rad(360))  # Converts 360 degrees to radians and back to degrees
#' }
#' \seealso{\link[sbi:sbi_rad2deg]{sbi$rad2deg}}
#' FILE: sbi/R/deg2rad.R
sbi$deg2rad <- function (x) {
  (x * pi) / 180
}

sbi_deg2rad = sbi$deg2rad


#' FILE: sbi/man/sbi_file.cat.Rd
#' \name{sbi$file.cat}
#' \alias{sbi$file.cat}
#' \alias{sbi_file.cat}
#' \title{Displays a File to the Terminal}
#' \description{This function reads a text file and displays it in the terminal.}
#' \usage{sbi_file.cat(filename)}
#' \arguments{
#'   \item{filename}{The name of the text file to display.}
#' }
#' \details{
#' This function reads the contents of a text file and returns it as a string, which can be displayed in the terminal.
#' }
#' \value{A string containing the contents of the file.}
#' \examples{
#' fname=tempfile()
#' fout=file(fname,"w")
#' cat("hello readme\n",file=fout)
#' close(fout)
#' sbi$file.cat(fname)
#' }
#' \seealso{\link[sbi:sbi_file.head]{sbi$file.head}}
#' FILE: sbi/R/file.cat.R
sbi$file.cat <- function (filename) {
  return(paste(readLines(filename), collapse="\n"))
}

sbi_file.cat = sbi$file.cat

#' FILE: sbi/man/sbi_file.head.Rd
#' \name{sbi$file.head}
#' \alias{sbi$file.head}
#' \alias{sbi_file.head}
#' \title{Displays the first Lines of a File}
#' \description{This function displays the first \code{n} lines of a text file.}
#' \usage{sbi_file.head(filename, n=6)}
#' \arguments{
#'   \item{filename}{The name of the text file to read.}
#'   \item{n}{The number of lines to display from the beginning of the file, default is 6.}
#' }
#' \details{
#' This function reads the first \code{n} lines of a text file and returns them as a vector of strings.
#' }
#' \value{A character vector containing the first \code{n} lines of the file.}
#' \examples{
#' fname=tempfile()
#' fout=file(fname,"w")
#' for (i in 1:20) {
#'    cat(paste(i, "hello readme\n",file=fout))
#' }
#' close(fout)
#' sbi$file.head(fname, n = 10)
#' }
#' \seealso{\link[sbi:sbi_file.cat]{sbi$file.cat}}

#' FILE: sbi/R/file.head.R
sbi$file.head <- function (filename, n=6) {
  if (!file.exists(filename)) {
    stop(paste('Error! File', filename, 'does not exist!'))
  }
  fin = file(filename, 'r')
  res = readLines(fin, n = n)
  close(fin)
  return(res)
}

sbi_file.head = sbi$file.head

#' FILE: sbi/man/sbi_flow.Rd
#' \name{sbi$flow}
#' \alias{sbi$flow}
#' \alias{sbi_flow}
#' \title{Create simple flowcharts with different shapes and arrows}
#' \description{
#'   The \code{sbi$flow} function allows you to create simple flowcharts with various shapes 
#'   (rectangles, circles, diamonds, etc.) and arrows or lines between them. You can specify 
#'   coordinates using chessboard notation (e.g., 'A1', 'C3') for placing shapes and drawing 
#'   connections.
#' }
#' \usage{
#' sbi_flow(x, y = NULL, z = NULL, x.incr = 0, y.incr = 0, 
#'          lab = "", family = "Arial", type = "arrow", axes = FALSE, lwd = 2, 
#'          width = 1, height = 0.5, cex = 1, col = "skyblue", border = "black", 
#'          arrow.col = "black", cut = 0.6, shadow = TRUE, shadow.col = "#bbbbbb99", ...)
#' }
#' \details{
#' This function provides an easy-to-use tool for creating simple flowcharts in R. You can 
#' customize the shapes, lines, arrows, labels, colors, and more to create flowcharts that 
#' fit your specific needs. For more advanced diagrams, consider using packages such as \code{diagram}.
#' }
#' \arguments{
#'   \item{x}{Coordinate(s) in chessboard notation like 'A1', 'C3', etc.}
#'   \item{y}{Coordinate(s) in chessboard notation. If given, assumes a line or arrow. Default: \code{NULL}.}
#'   \item{z}{Optional third coordinate for bezier curves/arrow. Default: \code{NULL}.}
#'   \item{x.incr}{Optional increment in x direction. Default: \code{0}.}
#'   \item{y.incr}{Optional increment in y direction. Default: \code{0}.}
#'   \item{lab}{Label(s) for a node shown as a rectangle. Default: \code{""}.}
#'   \item{family}{Font family for node labels. Default: \code{"Arial"}.}
#'   \item{type}{Shape type or arrow. Options include "arrow", "line", "rect", "circle", "ellipse", "hexagon", "diamond", etc. Default: \code{"arrow"}.}
#'   \item{axes}{Logical; show axes on the plot. Default: \code{FALSE}.}
#'   \item{lwd}{Line width for arrows or lines. Default: \code{2}.}
#'   \item{width}{Width of shape. Default: \code{0.6}.}
#'   \item{height}{Height of shape. Default: \code{0.3}.}
#'   \item{cex}{Text expansion for labels. Default: \code{1}.}
#'   \item{col}{Background color(s) for the shape. Default: \code{"skyblue"}.}
#'   \item{border}{Border color for the shape. Default: \code{"black"}.}
#'   \item{arrow.col}{Arrow color. Default: \code{"black"}.}
#'   \item{cut}{Position of the arrow cut (relative position between 0 and 1). Default: \code{0.6}.}
#'   \item{shadow}{Logical; add a shadow to the shape. Default: \code{TRUE}.}
#'   \item{shadow.col}{Color of the shadow. Default: \code{"#bbbbbb99"}.}
#'   \item{...}{Additional graphical parameters passed to plot functions.}
#' }
#' \examples{
#' font <- "Arial"
#' if (requireNamespace("extrafont", quietly = TRUE)) {
#'    extrafont::loadfonts(device = "pdf", quiet = TRUE)
#'    if (length(extrafont::fonts()) == 0) {
#'         extrafont::ttf_import()
#'         extrafont::loadfonts(device = "pdf", quiet = TRUE)
#'    }
#'    if ("Albertus Medium" \%in\% extrafont::fonts()) {
#'         font <- "Albertus Medium"
#'    } else if ("Georgia" \%in\% extrafont::fonts()) {
#'         font <- "Georgia"
#'    } else if ("Liberation Sans" \%in\% extrafont::fonts()) {
#'         font <- "Liberation Sans"
#'    }
#' }
#' flow <- sbi$flow
#' flow(4, 4, axes = TRUE, cex.axis = 3, family = font)
#' grid()
#' flow("A1", "C1", lwd = 3)
#' flow("A1", "B4", lwd = 3)
#' flow("B4", "D4", lwd = 3, cut = 0.9)
#' flow("D4", "D3", lwd = 3, type = "line")
#' flow("C1", "D3", lwd = 3, arrow.col = "salmon", type = "line")
#' flow("C1", "D1", lwd = 3, arrow.col = "salmon", type = "line")
#' flow("D1", "D3", lwd = 3, arrow.col = "salmon", type = "line")
#' flow("A1", lab = "Hello", width = 1.2, height = 0.8, cex = 1.2)
#' flow("C1", lab = "World!", col = "salmon", width = 1.2, height = 0.8, cex = 1.2)
#' flow("B4", lab = "B4", cex = 1.2)
#' flow("D3", lab = "This is\nD3", cex = 1.2, col = "cornsilk", height = 0.7)
#' } 
#' \seealso{\link[sbi:sbi-package]{sbi-package}}
#' FILE: sbi/R/flow.R
sbi$flow = function (x, y = NULL, z = NULL, x.incr = 0, y.incr = 0, lab = "", family = "Arial",
                     type = "arrow", axes = FALSE, lwd = 2, width = 1, height = 0.5, 
                     cex = 1, col = "skyblue", border = "black", arrow.col = "black", 
                     cut = 0.6, shadow = TRUE, shadow.col = "#bbbbbb99", ...) {
  
  # Debugging output to ensure lab and type are correctly passed
  f2v = function(x) {
    col = substr(x, 1, 1)
    col = as.integer(which(LETTERS == col)) + x.incr
    row = as.integer(substr(x, 2, 2)) + y.incr
    return(c(col, row))
  }
  
  # Handle multiple input coordinates
  if (length(x) > 1) {
    for (i in 1:length(x)) {
      if (length(y) == length(x)) {
        yi = y[i]
      } else {
        yi = y
      }
      if (length(lab) == length(x)) {
        labi = lab[i]
      } else {
        labi = lab
      }
      if (length(col) == length(x)) {
        coli = col[i]
      } else {
        coli = col
      }
      sbi$flow(x = x[i], y = yi, x.incr = x.incr, y.incr = y.incr, lab = labi, family = family, 
               type = type, axes = axes, lwd = lwd, width = width, height = height, 
               cex = cex, col = coli, border = border, arrow.col = arrow.col, 
               cut = cut, shadow = shadow, shadow.col = shadow.col, ...)
    }
    return()
  }
  
  # Case when both x and y are numeric (setup board)
  if (is.numeric(x) & is.numeric(y)) {
    plot(1, type = "n", xlim = c(0.5, x + 0.5), ylim = c(0.5, y + 0.5), 
         xlab = "", ylab = "", axes = FALSE, ...)
    if (axes) {
      axis(2, lwd = 0, family = family)
      axis(1, at = 1:x, labels = LETTERS[1:x], lwd = 0, family = family)
      box()
    }
    sbi$FLOWFONT = family
  }
  
  # Handle arrows or lines for coordinates like "A1", "C1", etc.
  else if (grepl("^[A-Z][0-9]+", x) && !is.null(y) && grepl("^[A-Z][0-9]+", y)) {
    from = f2v(x)
    to = f2v(y)
    if (type == "arrow") {
      hx <- (1 - cut) * from[1] + cut * to[1]
      hy <- (1 - cut) * from[2] + cut * to[2]
      arrows(hx, hy, to[1], to[2], lwd = lwd, code = 0, col = arrow.col, ...)
      for (a in c(20, 15, 10, 5)) {
        arrows(from[1], from[2], hx, hy, length = 0.05 * lwd, angle = a, lwd = lwd, col = arrow.col, ...)
      }
    } else {
      lines(x = c(from[1], to[1]), y = c(from[2], to[2]), lwd = lwd, col = arrow.col, ...)
    }
  }
  
  # Handle nodes (rectangles, text, etc.)
  else if (grepl("^[A-Z][0-9]+", x)) {
    pos = f2v(x)
    if (type != "text") {
        if (type == "arrow") { type = "rectangle" }
      poly = sbi$shape(0, 0, type = type, width = width, height = height, ...)
    }
    if (shadow & type != "text") {
      polygon(poly$x + pos[1] + 0.05, poly$y + pos[2] - 0.05, col = shadow.col, border = shadow.col)
    }
    if (type != "text") {
      polygon(poly$x + pos[1], poly$y + pos[2], col = col, border = border)
    }
    text(pos[1], pos[2], lab, cex = cex, family = sbi$FLOWFONT, ...)
  }
}

sbi_flow = sbi$flow

#' FILE: sbi/man/sbi_fmt.Rd
#' \name{sbi$fmt}
#' \alias{sbi$fmt}
#' \alias{sbi_fmt}
#' \title{Python like string formatting)}
#' \description{
#' This function implements Python like string formatting using curly braces as placeholder.
#' }
#' \usage{sbi_fmt(str,...)}
#' \arguments{
#'   \item{str}{string with curly brace place holders, either empty or with numbers}
#'   \item{...}{variables or values used to replace the curly brace placeholders}
#' }
#' \details{
#' The implements  features empty pairs of curly braces as well as numbered curly brace pairs to replace them
#' using the given variables or strings. 
#' }
#' \value{
#'  string with curly braces replaced by the given values
#' }
#' \examples{
#' sbi$fmt('I can say {} {}!',"Hello", "World")
#' sbi$fmt('I can say {2} {1}!',"World", "Hello")
#' }
#' \seealso{\link[sbi:sbi-package]{sbi-package}}
#' FILE: sbi/R/fmt.R
sbi$fmt <- function (str,...) {
    args=list(...);
    if (class(args[[1]]) == 'list') {
        args=args[[1]]
    }
    for (i in 1:length(args)) {
        str=sub("\\{\\}",args[[i]],str)
        str=sub(paste("\\{",i,"\\}",sep=''),
                args[[i]],str)
    }
    return(str)
}

sbi_fmt= sbi$fmt

#' FILE: sbi/man/sbi_gmean.Rd
#' \name{sbi$gmean}
#' \alias{sbi$gmean}
#' \alias{sbi_gmean}
#' \title{geometric mean of a numercial vector}
#' \description{
#' Calculate the geometric mean of a numerical vector. All values in `x` should be above zero.
#' }
#' \usage{sbi_gmean(x, na.rm=FALSE)}
#' \arguments{
#'   \item{x}{vector with positive numerical values}
#'  \item{na.rm}{should NA's be removed, default: FALSE}
#' }
#' \value{
#'  The geometric mean of the given vector
#' }
#' \examples{
#' gmean=sbi$gmean
#' x=10; y=20; z = 30
#' gmean(c(x,y,z))
#' gmean(c(x+0.5*x,y,z))
#' gmean(c(x,y+0.5*y,z))
#' gmean(c(x,y,z+z*0.5))
#' }
#' \seealso{\link[sbi:sbi-package]{sbi-package}, \link[sbi:sbi_hmean]{sbi$hmean}.} 
#' FILE: sbi/R/gmean.R
sbi$gmean <- function (x,na.rm=FALSE) {
    idx=which(!is.na(x))
    if (na.rm) {
        x=x[idx]
    } else if (length(idx)!= length(x)) {
        return(NA)
    }
    s=x[1]
    for (i in 2:length(x)) {
        s=s*x[i]
    }
    return(s^(1/length(x)))
}


sbi_gmean = sbi$gmean


#' FILE: sbi/man/sbi_hmean.Rd
#' \name{sbi$hmean}
#' \alias{sbi$hmean}
#' \alias{sbi_hmean}
#' \title{harmonic mean of a numercial vector}
#' \description{
#' Calculate the harmonic mean of a numerical vector. All values in `x` should be above zero.
#' }
#' \usage{sbi_hmean(x, na.rm=FALSE)}
#' \arguments{
#'   \item{x}{vector with positive numerical values}
#'  \item{na.rm}{should NA's be removed, default: FALSE}
#' }
#' \value{
#'  The harmonic mean of the given vector
#' }
#' \examples{
#' hmean=sbi$hmean
#' hmean(c(60,30)) # average speed
#' hmean(c(60,30,0)) # speed is zero
#' }
#' \seealso{\link[sbi:sbi-package]{sbi-package}, \link[sbi:sbi_hmean]{sbi$hmean}.} 
#' FILE: sbi/R/hmean.R
sbi$hmean <- function (x,na.rm=FALSE) {
    idx=which(!is.na(x))
    if (na.rm) {
        x=x[idx]
    } else if (length(idx)!= length(x)) {
        return(NA)
    }
    s=1/x[1]
    for (i in 2:length(x)) {
        s=s+(1/x[i])
    }
    return(1/(s/length(x)))
}


sbi_hmean = sbi$hmean

#' FILE: sbi/man/sbi_import.Rd
#' \name{sbi$import}
#' \alias{sbi$import}
#' \alias{sbi_import}
#' \title{Load other R files relative to the current R file}
#' \description{
#' This function loads other R files relative to the current Rscript file.
#' }
#' \usage{sbi_import(basename)}
#' \arguments{
#'   \item{basename}{The filename of the R file without an extension.}
#' }
#' \details{
#' The function allows the user to split its R application more easily into separate files, 
#' where other files still can be loaded more easily placed in parallel to the main script file.
#' }
#' \examples{ %options: eval=FALSE
#' \dontrun{
#'  fout = file("test.R",'w')
#'  cat("test = function(msg) { return(paste('testing',msg)) }\n",file=fout)
#'  close(fout)
#'  sbi$import('test')
#'  test("Hello from test!")
#'  }
#' }
#' \seealso{\link[sbi:sbi-package]{sbi-package}}
#' FILE: sbi/R/import.R
sbi$import <- function (basename) {
    if (interactive()) {
        stop("Error: The function sbi_import works only in R-scripts run with Rscript")
    }
    options <- commandArgs(trailingOnly = FALSE)
    file.arg <- "--file="
    idx=grep(file.arg,options)
    script.name <- sub(file.arg, "", options[idx])
    dir=dirname(script.name)
    success=FALSE
    for (ext in c(".R",".r")) {
        fname=paste(basename,ext,sep="")
        if (file.exists(file.path(dir,fname))) {
            source(file.path(dir,fname))
            success=TRUE
            break
        }
    }
    if (!success) {
        stop(paste("Error: Module '",basename,"' not available!",sep=""))
    }
}

sbi_import = sbi$import

#' FILE: sbi/man/sbi_input.Rd
#' \name{sbi$input}
#' \alias{sbi$input}
#' \alias{sbi_input}
#' \title{Get input strings from the user as well from with R script files}
#' \description{
#'   Replacement for the readline function in non-interactive scripts. 
#'   As the readline function does only works in interactive mode we need an alternative.
#' }
#' \usage{sbi_input(prompt)}
#' \arguments{
#'   \item{prompt}{text displayed to ask for input of the user}
#' }
#' \value{
#' input entered by the user as a string
#' }
#' \examples{ %options: eval=FALSE
#' \dontrun{
#'  x=sbi$input('Enter a numerical value: ')
#'  x=as.numeric(x)
#'  print(paste("x*x is",x*x))
#'  }
#' }
#' \seealso{\link[sbi:sbi-package]{sbi-package}}
#' FILE: sbi/R/input.R
sbi$input = function (prompt="Enter: ") {
    if (interactive() ){ 
        return(readline(prompt))
    } else {
        cat(prompt);
        return(readLines("stdin",n=1))
    }
}
sbi_input = sbi$input


#' FILE: sbi/man/sbi_is.dict.Rd
#' \name{sbi$is.dict}
#' \alias{sbi$is.dict}
#' \alias{sbi_is.dict}
#' \title{Check if a list has unique keys (dictionary check)}
#' \description{
#' This function checks if a list has unique names (keys), ensuring that no key is duplicated.
#' }
#' \usage{sbi_is.dict(obj)}
#' \arguments{
#'   \item{obj}{A list-like object to check.}
#' }
#' \details{
#' The function checks if all keys in the list (names of the list elements) are unique. If any key is duplicated, the function will return \code{FALSE}.
#' }
#' \value{
#' \code{TRUE} if the object has unique keys, otherwise \code{FALSE}.
#' }
#' \examples{
#' d = sbi$dict(a = 1, b = 2)
#' sbi$is.dict(d)  # Returns TRUE
#' l = list(a=1,b=2,a=3)
#' class(d)
#' class(l)
#' sbi$is.dict(l)
#' }
#' \seealso{\link[sbi:sbi-package]{sbi-package}}
#' FILE: sbi/R/is.dict.R
sbi$is.dict <- function (obj) {
  if (!is.list(obj)) {
    return(FALSE)
  }
  keys <- names(obj)
  return(length(keys) == length(unique(keys)))
}

sbi_is.dict = sbi$is.dict


#' FILE: sbi/man/sbi_is.outlier.Rd
#' \name{sbi$is.outlier}
#' \alias{sbi$is.outlier}
#' \alias{sbi_is.outlier}
#' \title{check if a given value within a vector is an outlier}
#' \description{
#' Check if a given value within a vector is an outlier based on the 3xSD criteria.
#' }
#' \usage{sbi_is.outlier(x)}
#' \arguments{
#'   \item{x}{A vector with numerical values.}
#' }
#' \details{
#'  The function applies the 3SD criteria declaring all values which are more than 3 standard deviations away
#'  from the mean as an outlier.
#' }
#' \value{
#' a vector with boolean values, where TRUE means that the value is an outlier based on the 3SD criteria.
#' }
#' \examples{
#' rn=rnorm(3000)
#' table(sbi$is.outlier(rn))
#' }
#' \seealso{\link[sbi:sbi-package]{sbi-package}}
#' FILE: sbi/R/is.outlier.R
sbi$is.outlier = function (x) { 
    return(abs(scale(x))>3) 
}

sbi_is.outlier = sbi$is.outlier

#' FILE: sbi/man/sbi_itemchart.Rd
#' \name{sbi$itemchart}
#' \alias{sbi$itemchart}
#' \alias{sbi_itemchart}
#' \title{graphical chart for a short item list with three or four items}
#' \description{
#' This graphs allows the visual display of a short item list which are somehow opposing or complementary
#' to each other.
#' }
#' \usage{sbi_itemchart(labels,cex=1.2,col=c("#bbddff","#ffcccc","#ccffcc","#ffffbb"),...)}
#' \arguments{
#'   \item{labels}{list of three or four labels, longer strings should be splitted by using newline chars.}
#'   \item{cex}{character expansion for the text, default: 1.2}
#'   \item{col}{color vector for the items, default: c("#bbddff","#ffcccc","#ccffcc","#ffffbb")}
#'   \item{\ldots}{other arguments delegated to the plot function}
#' }
#' \details{
#'  This function is used to illustrate important points which are opposig each other on the 
#'  three sided f a triangle or on the four sides of a 45 degree rotated rectangle.
#' }
#' \examples{ %options: fig.width=10,fig.height=5
#' opar=par(mai=c(0.2,0.2,0.2,0.2),mfrow=c(1,2))
#' sbi$itemchart(c("Randomness\np-value","Uncertainty\nConfidence\nInterval",
#'    "Importance\nEffect Size"))
#' sbi$itemchart(c("Surveys and\nQuestionaires","Experiments",
#'   "Observational\nStudies","Existing\nData Analysis"))
#' par(opar)
#' }
#' \seealso{\link[sbi:sbi-package]{sbi-package}}
#' FILE: sbi/R/itemchart.R


sbi$itemchart <- function (labels,cex=1.2,col=c("#bbddff","#ffcccc","#ccffcc","#ffffbb"),...) {
    if (length(labels) == 3) {
        plot(1,type="n",xlim=c(0,0.6),ylim=c(-0.05,0.7),xlab="",ylab="",axes=FALSE,...)
        polygon(x=c(0.1,0.2,0.3,0.3,0.1),y=c(0.1,0.2,0.5,0.7,0.1),col=col[1])
        polygon(x=c(0.5,0.4,0.3,0.3,0.5),y=c(0.1,0.2,0.5,0.7,0.1),col=col[2])
        polygon(x=c(0.1,0.2,0.4,0.5,0.1),y=c(0.1,0.2,0.2,0.1,0.1),col=col[3])
        text(0.1,0.5,labels[1],cex=cex,font=2)
        text(0.5,0.5,labels[2],cex=cex,font=2)    
        text(0.3,0.025,labels[3],cex=cex,font=2)        
    } else if (length(labels) == 4) {
        plot(1,type="n",xlim=c(0.1,0.9),ylim=c(0.1,0.9),xlab="",ylab="",axes=FALSE) 
        polygon(x=c(0.2,0.3,0.5,0.5,0.2),y=c(0.5,0.5,0.8,0.9,0.5),col=col[1])
        text(0.2,0.75,labels[1],cex=cex,font=2)  
        polygon(x=c(0.8,0.7,0.5,0.5,0.8),y=c(0.5,0.5,0.8,0.9,0.5),col=col[2])
        text(0.8,0.75,labels[2],cex=cex,font=2)  
        polygon(x=c(0.8,0.7,0.5,0.5,0.8),y=c(0.5,0.5,0.2,0.1,0.5),col=col[3])
        text(0.8,0.25,labels[3],cex=cex,font=2)  
        polygon(x=c(0.2,0.3,0.5,0.5,0.2),y=c(0.5,0.5,0.2,0.1,0.5),col=col[4])
        text(0.2,0.25,labels[4],cex=cex,font=2)  
        
    } else {
        stop("Error: Currently only three our four labels are supported")
    }   
}

sbi_itemchart = sbi$itemchart

#' FILE: sbi/man/sbi_kroki.Rd
#' \name{sbi$kroki}
#' \alias{sbi$kroki}
#' \alias{sbi_kroki}
#' \title{Create Diagrams using the Online tool https://kroki.io}
#' \description{
#'   This function is creates a URL which can be easily embedded into Markdown code for displaying
#'   diagrams supported by the online tool https://kroki.io.
#'   There is as well an online diagram editor, see here: https://niolesk.top/.
#' }
#' \usage{sbi_kroki(text="A --> B",filename=NULL,type="ditaa",ext="png",cache=TRUE,plot=FALSE)}
#' \arguments{
#'  \item{text}{some diagram code, default: "A --> B"}
#'  \item{filename}{some input file, either _text_ or _file_ must be given, default: NULL}
#'  \item{type}{diagram type, supported is ditaa, graphviz, and many others, see the kroki website, default: "ditaa"}
#'  \item{ext}{file extension, usally 'png', 'svg' or 'pdf', default: "png"}
#'  \item{cache}{should the image be cached locally using crc32 digest files in an _img_ folder, default: TRUE}
#'  \item{plot}{should the image directly plotted, default: FALSE}
#' }
#' \details{
#'  The function allows you to create sophisticated flowcharts using different diagram tools
#'  by the niolesk webservice. For details on how to create diagrams you might to have a look at the 
#'  diagram tool help pages. Here some links:
#'  \describe{
#'    \item{ditaa documentation}{\url{https://github.com/stathissideris/ditaa}}
#'    \item{plantuml documentation}{\url{https://plantuml.com/}}
#'  }
#' }
#' \examples{
#' url1=sbi$kroki('
#' digraph g { 
#'  rankdir="LR";
#'  node[style=filled,fillcolor=beige];
#'  A -> B -> C ; 
#'  }',
#'  type="graphviz")
#'  url2=sbi$kroki("
#'  +---------+    +--------+
#'  |    AcEEF+--->+   BcFEE+
#'  +---------+    +--------+
#'  ")
#'  url1
#'  url2
#'  sbi$kroki("digraph { node[shape=box,style=filled,fillcolor=beige]; plot -> kroki; }",type="graphviz",plot=TRUE)
#' }
#' \seealso{\link[sbi:sbi-package]{sbi-package}}
#' FILE: sbi/R/kroki.R

sbi$kroki <- function (text="A --> B",filename=NULL,type="ditaa",ext="png",cache=TRUE,plot=FALSE) {
    # memCompress and openssl::base64_encode in R 
    # did not work always as expected
    # using good old Tcl
    if (!requireNamespace("tcltk",quietly=TRUE)) {
        stop("Error: package tcltk is required to run sbi$kroki")
    }
    tcltk::.Tcl("
    proc dia2kroki {text} {
        return [string map {+ - / _ = \"\"}  [binary encode base64 [zlib compress $text]]]
    }
    ")
    if(plot & !requireNamespace("png",quietly=TRUE)) {
        stop("Error: Plotting kroki images requires library png!")
    }
    if (!is.null(filename)) {
        if (!file.exists(filename)) {
            stop(paste("Error: File",filename,"does not exists!"))
        } else {
            fin=file(filename,'r')
            text=readLines(fin,n=-1L)
            close(fin)
            text=paste(text,collapse="\n")
        }
    }
    url = tcltk::tclvalue(tcltk::tcl("dia2kroki",text))
    url= paste("https://kroki.io",type,ext,url,sep="/")
    if (cache) {
        if (!requireNamespace("digest",quietly=TRUE)) {
            stop("You need to install the digest library to cache images!")
        } 
        if (!dir.exists("img")) {
            dir.create("img")
        }
        filename=paste(digest::digest(url,"crc32"),".",ext,sep="")
        imgname=file.path("img",filename)
        if (!file.exists(imgname)) {
            utils::download.file(url,imgname,mode="wb")
        }
        if (plot) {
            img=png::readPNG(imgname)
            grid::grid.raster(img)
        } else {
            return(imgname)
        }
    } else {
        if (plot) {
            img=png::readPNG(url)
            grid::grid.raster(img)
        } else {
            return(url)
        }
    }
}

sbi_kroki = sbi$kroki

#' FILE: sbi/man/sbi_kurtosis.Rd
#' \name{sbi$kurtosis}
#' \alias{sbi$kurtosis}
#' \alias{sbi_kurtosis}
#' \title{fourth central moment of a distribution}
#' \description{
#'   Calculate the fourth central moment of a distribution. Values higher than 0
#'   indicate heavy-tailed distributions, values of lower than zero means 
#'   light-tailed (sharp peak) distributions. Values around zero mean normal value
#'   like distribution. As the normal kurtosis formula has for normal distributions
#'   a value of three, usually the excess kurtosis as in this implementation is 
#'   used which involves substraction of 3.
#' }
#' \usage{sbi_kurtosis(x, na.rm=FALSE)}
#' \arguments{
#'   \item{x}{vector with positive numerical values}
#'   \item{na.rm}{should NA's be removed, default: FALSE}
#' }
#' \value{numerical value for the excess kurtosis}
#' \examples{
#' sbi$kurtosis(1:10)      # very uniform, should be negative
#' sbi$kurtosis(runif(10,min=1,max=5)+rnorm(10,mean=3,sd=0.2))
#' sbi$kurtosis(rnorm(100,mean=10,sd=0.5)) # close to zero
#' sbi$kurtosis(rt(50,df=1)) # higher than normal
#' }
#' \seealso{\link[sbi:sbi-package]{sbi-package}, \link[sbi:sbi_skewness]{sbi$skewness}}
#' FILE: sbi/R/kurtosis.R

sbi$kurtosis <- function (x,na.rm=FALSE) {
    if (na.rm) {
        x=x[!is.na(x)]
    } else {
        if (any(is.na(x))) {
            return(NA)
        }
    }
    g=(sum((x-mean(x,na.rm=na.rm))^4)
       /length(x))/(sd(x)^4)-3
    return(g)
}

sbi_kurtosis <- sbi$kurtosis


#' FILE: sbi/man/sbi_lmplot.Rd
#' \name{sbi$lmplot}
#' \alias{sbi$lmplot}
#' \alias{sbi_lmplot}
#' \title{XY-plot with linear model and the confidence intervals}
#' \description{
#'   This method can be used to visualize the confidence intervals for 
#'   the predictions and the linear model.
#' }
#' \usage{sbi_lmplot(x,y=NULL, data=NULL,col="blue",pch=19,
#'               col.lm="red",col.plm="red",col.pi="blue",
#'               grid=TRUE,polygon=TRUE,col.polygon="#cccccc33",
#'               xlab=NULL,ylab=NULL,...)
#' }
#' \arguments{
#'   \item{x}{numerical vector or formula}
#'   \item{y}{numerical vector}
#'   \item{data}{data frame, used if x is a formula, default: NULL}
#'   \item{col}{scalar or vector for the color for the plotting character default: 'blue'}
#'   \item{pch}{the plotting character, default: 19}
#'   \item{col.lm}{color for the regression line, default: 'red'}
#'   \item{col.plm}{color for the regression line confidence interval, default: 'red'}
#'   \item{col.pi}{color for the prediction confidence interval, default: 'blue'}
#'   \item{grid}{should a grid be drawn in the plot, default: TRUE}
#'   \item{polygon}{should the confidence interval for the regression line been shown as transparent polygon, default: TRUE}
#'   \item{col.polygon}{the color for the polygon, default: "#cccccc33"}
#'   \item{xlab}{the x-label, if not given chosen by the variable name, default: NULL}
#'   \item{ylab}{the y-label, if not given chosen by the variable name, default: NULL}
#'   \item{...}{other arguments which will be forwarded to the plot function}
#' }
#' \examples{ %options: fig.width=9,fig.height=6
#' par(mfrow=c(1,2))
#' data(iris) 
#' sbi$lmplot(iris$Sepal.Width, iris$Sepal.Length,
#'    col=as.numeric(iris$Species)+1,col.pi="bisque4",
#'    col.lm="black",xlab="Sepal.Width",ylab="Sepal.Length")
#' props=c(0.0441,0.0133,0.0183,0.0238,0.0389,
#'         0.0648,0.0275,0.0704,0.0796,0.036,0.0132,
#'         0.108,0.136,0.0383,0.1008)
#' years=2005:2019
#' sbi$lmplot(years,props,ylim=c(0,0.3),xlab="Year",ylab="Proportion",
#'    col.pi=NULL,col.plm='#FFB0B066',col.polygon='#FFB0B066')
#' 
#' }
#' \seealso{\link[sbi:sbi-package]{sbi-package}}

#' FILE: sbi/R/lmplot.R
sbi$lmplot = function (x,y=NULL, data=NULL,col="blue",pch=19,col.lm="red",col.plm="red",col.pi="blue",
                       grid=TRUE,polygon=TRUE,col.polygon="#cccccc33",xlab=NULL,ylab=NULL,...) {
    cnames=c('x','y')
    if (class(x)[1]=="formula") {
        if (!is.data.frame(data)) {
            df <- model.frame(x)
            colnames(df)=gsub(".+\\$","",colnames(df))
        } else {
            df <- model.frame(x, data = data)
        }
        df=df[,c(2,1)]
        cnames=colnames(df)
        colnames(df)=c('x','y')
        x=df$x
        y=df$y
    } else {
        df <- data.frame(x=x,y=y)
    }
    if (is.null(xlab)) {
        xlab=cnames[1]
    }
    if (is.null(ylab)) {
        ylab=cnames[2]
    }
    plot(y ~ x, data=df, pch=pch, col=col,xlab=xlab,ylab=ylab,...)
    if (grid) {
        grid (NULL,NULL, lty = 3, col = "grey30")
    }
    mod <- lm(y ~ x, data=df)
    new.x.df = data.frame(
        x = seq(from   = range(df$x)[1],
                to     = range(df$x)[2],
                length = 11 ))
    lty=list(upr=2,lwr=2,fit=1)
    lcol=list(upr=col.plm,lwr=col.plm,fit=col.lm)
    poly.y=c()
    poly.x=c()
    for (lim in c("upr","lwr","fit")) {
        nx=new.x.df$x
        ny=predict(mod, new.x.df,   
                            interval = "confidence" )[,lim]
        lines(x   = nx,
              y   = ny,
              col = lcol[[lim]],lty=lty[[lim]],lwd=2 )
        if (lim == "upr") {              
            poly.x=nx
            poly.y=ny
        } else if (lim == "lwr") {
            poly.x=c(poly.x,rev(nx))
            poly.y=c(poly.y,rev(ny))               
        }
    }
    if (polygon) {
        polygon(poly.x,poly.y,col=col.polygon,border=col.polygon)
        options(warn=-1)
        do.call('points',list(y ~ x, data=df, pch=pch, col=col,...))
        options(warn=0)
    }
    for (lim in c("upr","lwr")) {
        if (!is.null(col.pi)) {
            lines(
                  x   = new.x.df$x,
                  y   = predict( mod, new.x.df, 
                                interval = "prediction" )[ , lim ],
                  col = col.pi ,lty=2,lwd=2)
        }
     }
}

sbi_lmplot = sbi$lmplot

#' FILE: sbi/man/sbi_mhist.Rd
#' \name{sbi$mhist}
#' \alias{sbi$mhist}
#' \alias{sbi_mhist}
#' \title{Lattice like histogram but base graphics compatible}
#' \description{
#'   This function creates for 2-4 groups histograms with a stripe on top
#'   using the same y-scales for all groups.
#' }
#' \usage{sbi_mhist(x,y,breaks=10,cols='grey80',...)}
#' \arguments{
#'   \item{x}{numerical vector}
#'   \item{y}{categorical variable 2-4 levels}
#'   \item{breaks}{how many breaks within the histogram, default: 10}
#'   \item{cols}{the colors to be used, default: 'grey80'}
#'   \item{...}{other arguments which will be forwarded to the plot function}
#' }
#' \examples{ %options: fig.width=9,fig.height=4.5
#' data(iris)
#' sbi$mhist(iris$Sepal.Length,iris$Species,cols="skyblue")
#' }
#' \seealso{\link[sbi:sbi-package]{sbi-package}}

#' FILE: sbi/R/mhist.R
sbi$mhist <- function (x,y,breaks=10,cols='grey80',...) {
    groups=y
    y=x
    nr=length(levels(groups))
    opar=par(mfrow=c(1,nr),mai=c(0.4,0.6,0.4,0.0))
    breaks=hist(y,plot=FALSE)$breaks
    #recover()
    if (length(cols)==1) {
        cols=rep(cols,length(levels(groups)))
        names(cols)=levels(groups)
    }
    mx=0
    for (gr in levels(groups)) {
        m=max(table(cut(y[groups==gr],breaks=breaks)))
        if (m>mx) {
            mx=m
        }
    }
    mx=mx*1.15
    x=1
    brid=seq(1,length(breaks),by=2)
    #recover()
    for (gr in levels(groups)) {
        hist(y[groups==gr],
             ylab="n",col=cols[[gr]],main='',
             breaks=breaks,xlim=c(min(breaks),max(breaks)),
             ylim=c(0,mx),axes=FALSE,xaxs='i','yaxs'='i');
          
        box(); 
        if (x==1 | x == 3) {
            axis(1,labels=breaks[brid],at=breaks[brid])
        } else {
            axis(3,labels=breaks[brid],at=breaks[brid])
            axis(1,labels=FALSE,at=breaks[brid])
        }
        if (x == 1) { 
            # omit top tick as this is in label region
            ticks=axTicks(2)
            if (ticks[length(ticks)]>0.95*mx) {
                axis(2,labels=ticks[1:(length(ticks)-1)],
                     at=ticks[1:(length(ticks)-1)])
            } else {
                axis(2)
            }
        }
        rect(min(breaks),mx-0.1*mx,max(breaks),mx,col='#FFE4CC')
        text((min(breaks)+max(breaks))/2,((mx-0.1*mx)+mx)/2,gr,adj=0.5,cex=1.5)
        if (length(levels(groups)) %in% c(2,4) & x %in% c(1,3)) {
            par(mai=c(0.4,0.3,0.4,0.3))
            axis(3,labels=FALSE)
            
        }
        if (length(levels(groups)) %in% c(2,4) & x %in% c(2,4)) {
            par(mai=c(0.4,0.3,0.4,0.3))
            axis(4,labels=FALSE)
            
        }
        if (length(levels(groups)) %in% c(3,6) & x %in% c(1,4)) {
            par(mai=c(0.4,0.3,0.4,0.3))
        }
        if (length(levels(groups)) %in% c(3,6) & x %in% c(2,5)) {
            par(mai=c(0.4,0.0,0.4,0.6))
        }
        if (length(levels(groups)) %in% c(3,6) & x %in% c(3,6)) {
            axis(4,labels=FALSE)
            par(mai=c(0.4,0.0,0.4,0.6))
        }
        x=x+1
    }
    par(opar)
}

sbi_mhist <- sbi$mhist

#' FILE: sbi/man/sbi_mi.Rd
#' \name{sbi$mi}
#' \alias{sbi$mi}
#' \alias{sbi_mi}
#' \title{Mutual Information for two numerical variables or for a binned table}
#' \description{
#'   Return the mutual information, the non-linear strength of a relationship between two 
#'   numerical or of a binned table.
#' }
#' \usage{sbi_mi(x,y=NULL,breaks=4,norm=FALSE)}
#' \arguments{
#'   \item{x}{either a binned table, a matrix or data.frame or a numerical vector}
#'   \item{y}{a numerical vector if x is not a binned table or matrix or data.frame}
#'   \item{breaks}{number of breaks to create a binned table if x and y are numerical vectors, default: 4}
#'   \item{norm}{if input is given should the matrix be normalized by dividing the off-diagonal values by the mutual information in the diagonals, so the self mutual information, default: FALSE}
#' }
#' \details{
#' The function computes the mode, i.e., the most frequent level in the given categorical variable.
#' }
#' \value{Mutual information value as scalar if input is table or two vectors or as matrix if input is matrix or data.frame}
#' \examples{
#' rn1=rnorm(100,mean=10,sd=1);
#' rn2=rn1+0.5*rnorm(100)
#' cor(rn1,rn2) # high
#' cor(rn1,sample(rn2)) #random 
#' sbi$mi(rn1,rn2) # high 
#' sbi$mi(rn1,sample(rn2)) #random
#' sbi$mi(rn1,rn2,breaks=4)
#' sbi$mi(rn1,rn2,breaks=7)
#' data(swiss)
#' round(sbi$mi(swiss),2)
#' round(sbi$mi(swiss,norm=TRUE),2)
#' }
#' \seealso{\link[sbi:sbi-package]{sbi-package}}
#' FILE: sbi/R/mi.R
sbi$mi = function (x,y=NULL,breaks=4,norm=FALSE) {
    if (is.matrix(x) | is.data.frame(x)) {
        if (ncol(x)==2) {
            return(sbi$mi(x=x[,1],y=x[,2],breaks=breaks))
        } else {
            M=matrix(0,nrow=ncol(x),ncol=ncol(x))
            rownames(M)=colnames(M)=colnames(x)
            for (i in 1:(ncol(x)-1)) {
                for (j in i:ncol(x)) {
                    M[i,j]=M[j,i]=sbi$mi(x[,i],x[,j],breaks=breaks)
                }   
            }
            # last cell
            M[ncol(x),ncol(x)]=sbi$mi(x[,ncol(x)],x[,ncol(x)])
            if (norm) {
                M=M/diag(M)
            }
            return(M)
        }
    }
    if (!is.table(x)) {
        if (class(y)[1] != "NULL") {
            x=table(cut(x,breaks=breaks),cut(y,breaks=breaks))        
        } else {
            stop("if x is vector, y must be given as well")
        }
    }
    f1=x/sum(x)
    fx=rowSums(f1)
    fy=colSums(f1)
    fn=fx %o% fy
    f2=fn/sum(fn)
    LR = ifelse(f1>0,log(f1/f2),0)
    MI = sum(f1*LR)
    return(MI)
}

sbi_mi = sbi$mi

#' FILE: sbi/man/sbi_mkdoc.Rd
#' \name{sbi$mkdoc}
#' \alias{sbi$mkdoc}
#' \alias{sbi_mkdoc}
#' \title{Extract embedded Markdown documentation and Code chunks}
#' \description{
#'   Extract embedded Markdown documentation after `#'` and convert it into HTML. 
#'   Further include constructs like '## include "header.md" are supported.
#' }
#' \usage{sbi_mkdoc(infile,cssfile="mini.css",eval=FALSE)}
#' \arguments{
#'   \item{infile}{R file with embedded Markdown code (after #' comments)}
#'   \item{cssfile}{css stylesheet file, if not there a minimal css file will be created, you can modify the file later, default: mini.css}
#'   \item{eval}{should the code chunks being evaluated, default: FALSE (for security reasons)}
#' }
#' \examples{ %options: eval=FALSE
#' \dontrun{
#'  sbi$mkdoc('test.R')
#'  } 
#' }
#' \seealso{\link[sbi:sbi-package]{sbi-package}}
#' FILE: sbi/R/mkdoc.R
sbi$mkdoc <- function (infile,cssfile="mini.css",eval=FALSE)  {
    if (eval & !requireNamespace("rmarkdown")) {
        stop("Error: library rmarkdown missing but it is required!")
    }
    t1=Sys.time()
    cat("converting ...", infile,"\n")
    fin  = file(infile, "r")
    outfile=gsub("\\.[rR][a-z]*$",".Rmd",infile)
    htmlfile=gsub("\\.[rR][a-z]*$",".html",infile)    
    fout = file(outfile,'w')
    while(length((line = readLines(fin,n=1)))>0) {
        if (grepl("^\\s*#'",line)) {
            line=gsub("^\\s*#' ?","",line)       
            if (!eval) {
                line=gsub("```\\{r .+","```{r}",line)
            }
            cat(line,"\n",file=fout)
        } else if (grepl("^\\s*## include ",line)) {
            fname=gsub(".+?include +\"(.+)\".*","\\1",line) 
            if (file.exists(fname)) {             
                inc=file(fname,"r")             
                while(length((linei = readLines(inc,n=1)))>0) {                         
                    cat(linei,"\n",file=fout)
                }
                close(inc)
            }
        }
    }
    close(fin)
    close(fout)
    if (!file.exists(cssfile)) {
        fout = file(cssfile,'w')
        cat(sbi$CSS,"\n",file=fout)
        close(fout)
    }
    if (!eval) {
        system(sbi$fmt("pandoc -s -f markdown -c {1} -o {2} {3}",cssfile,htmlfile,outfile))
    } else {
        rmarkdown::render(outfile,rmarkdown::html_document(css="mini.css",theme=NULL))
    }
    cat("Processing done in",round(as.numeric(Sys.time()-t1,units="secs"),2),"seconds!\n")
}
sbi_mkdoc = sbi$mkdoc

#' FILE: sbi/man/sbi_modus.Rd
#' \name{sbi$modus}
#' \alias{sbi$modus}
#' \alias{sbi_modus}
#' \title{Return the most often Level in a Categorical variable}
#' \description{Return the most often apparent level in the categorical variable.}
#' \usage{sbi_modus(catvar)}
#' \arguments{
#'   \item{catvar}{a vector with elements of class factor or character.}
#' }
#' \details{
#' The function computes the mode, i.e., the most frequent level in the given categorical variable.
#' }
#' \value{Most often apparent level in the categorical variable.}
#' \examples{
#' sbi$modus(c('A', 'A', 'B', 'C'))
#' sbi$modus(c('A', 'A', 'B', 'B', 'C'))
#' }
#' \seealso{\link[sbi:sbi-package]{sbi-package}}
#' FILE: sbi/R/modus.R
sbi$modus <- function (catvar) {
  tab <- table(catvar)
  idx <- which(max(tab) == tab)
  return(names(tab)[idx])
}
sbi_modus = sbi$modus

#' FILE: sbi/man/sbi_pcor.Rd
#' \name{sbi$pcor}
#' \alias{sbi$pcor}
#' \alias{sbi_pcor}
#' \title{Partial Correlation}
#' \description{Partial correlation between two variables after control for other variables.}
#' \usage{sbi_pcor(x,y,z, method="pearson")}
#' \arguments{
#'   \item{x}{numeric vector, missing values are allowed}
#'   \item{y}{numeric vector, missing values are allowed}
#'   \item{z}{numeric vector, matrix or data frame,  missing values are allowed}
#'   \item{method}{character string indicating which partial correlation coefficient is to be computed, either "pearson" (default), or or "spearman"}
#' }
#' \value{Estimate gives the partial correlation coefficient between x and y given z}
#' \details{
#'   Calculate partial correlation coefficient of either parametric ("Pearson") 
#'   or non-parametric ("Spearman") statistics corrected for one or more other variables.
#' }
#' \examples{
#' y.data <- data.frame(
#'   hl=c(7,15,19,15,21,22,57,15,20,18),
#'   disp=c(0.000,0.964,0.000,0.000,0.921,0.000,0.000,1.006,0.000,1.011),
#'   deg=c(9,2,3,4,1,3,1,3,6,1),
#'   BC=c(1.78e-02,1.05e-06,1.37e-05,7.18e-03,0.00e+00,0.00e+00,0.00e+00,
#'        4.48e-03,2.10e-06,0.00e+00)
#' )
#' # partial correlation between "hl" and "disp" given "deg" and "BC"
#' sbi$pcor(y.data$hl,y.data$disp,y.data[,c("deg","BC")])
#' }
#' \seealso{\link[sbi:sbi-package]{sbi-package}, \link[sbi:sbi_pcor.test]{sbi$pcor.test}.}

#' FILE: sbi/R/pcor.R
sbi$pcor = function (x,y,z,method='pearson') {
    r=sbi$pcor.test(x,y,z,method=method)$estimate
    return(r)
}

sbi_pcor = sbi$pcor

#' FILE: sbi/man/sbi_pcor.test.Rd
#' \name{sbi$pcor.test}
#' \alias{sbi$pcor.test}
#' \alias{sbi_pcor.test}
#' \title{Partial Correlation test}
#' \description{Partial correlation test between two variables after control for other variables.}
#' \usage{sbi_pcor.test(x,y,z,method="pearson")}
#' \arguments{
#'   \item{x}{numeric vector, missing values are allowed}
#'   \item{y}{numeric vector, missing values are allowed}
#'   \item{z}{numeric vector, matrix or data frame,  missing values are allowed}
#'   \item{method}{character string indicating which partial correlation coefficient is to be computed, either "pearson" (default), or or "spearman"}
#' }
#' \value{Returns list with the following components:
#'   \item{estimate}{gives the partial correlation coefficient between x and y given z}
#'   \item{p.value}{gives the p-value of the test}
#'   \item{statistics}{gives the value of the test statistics}
#'   \item{n}{gives the number of samples after deleting all the missing samples}
#'   \item{gn}{gives the number of given variables}
#'   \item{method}{gives the correlation method used}
#' }
#' \details{
#'   Calculate partial correlation coefficient of either parametric ("Pearson") 
#'   or non-parametric ("Spearman") statistics corrected for one or more other variables.
#' 
#'   This implementation is based on ideas in:
#'   \url{http://r.789695.n4.nabble.com/Partial-correlations-and-p-values-td908641.html}
#'   same results as with ppcor package!
#' }
#' \examples{
#' y.data <- data.frame(
#'   hl=c(7,15,19,15,21,22,57,15,20,18),
#'   disp=c(0.000,0.964,0.000,0.000,0.921,0.000,0.000,1.006,0.000,1.011),
#'   deg=c(9,2,3,4,1,3,1,3,6,1),
#'   BC=c(1.78e-02,1.05e-06,1.37e-05,7.18e-03,0.00e+00,0.00e+00,0.00e+00,
#'        4.48e-03,2.10e-06,0.00e+00)
#' )
#' # partial correlation between "hl" and "disp" given "deg" and "BC"
#' sbi$pcor.test(y.data$hl,y.data$disp,y.data[,c("deg","BC")])
#' }
#' \seealso{\link[sbi:sbi-package]{sbi-package}, \link[sbi:sbi_pcor]{sbi$pcor}.}

#' FILE: sbi/R/pcor.test.R
sbi$pcor.test <- function (x,y,z,method='pearson') {
   if (is.data.frame(z)) {
       z=as.matrix(z)
   }
   if (is.matrix(z)) {
       df=data.frame(x=x,y=y) 
       for (col in 1:ncol(z)) {
           df=cbind(df,z=z[,col])
           colnames(df)[ncol(df)]=colnames(z)[col]
       }
   } else {
       df=data.frame(x=x,y=y,z=z)
   }
   frmx=formula(paste("x~",paste(colnames(df)[3:ncol(df)],collapse="+"),sep=""))
   frmy=formula(paste("y~",paste(colnames(df)[3:ncol(df)],collapse="+"),sep=""))
   df=na.omit(df)
   if (method=='spearman') {
       df=as.data.frame(apply(df,2,rank))
   }
   xres=residuals(lm(frmx,data=df))
   yres=residuals(lm(frmy,data=df))

   pr=cor(xres,yres)
   gn=ncol(df)-2 # number of z
   n=nrow(df)
   statistic <- pr*sqrt((n-2-gn)/(1-pr^2))
   p.value <- 2*pnorm(-abs(statistic))
   return(data.frame(estimate=pr,p.value=p.value,statistic=statistic,n=n,gn=gn,method=method))
}

sbi_pcor.test = sbi$pcor.test


#' FILE: sbi/man/sbi_rad2deg.Rd
#' \name{sbi$rad2deg}
#' \alias{sbi$rad2deg}
#' \alias{sbi_rad2deg}
#' \title{Convert Angle from Radians to Degrees}
#' \description{Convert an angle from radians to degrees.}
#' \usage{sbi_rad2deg(x)}
#' \arguments{
#'   \item{x}{Angle in radians}
#' }
#' \value{The angle converted to degrees.}
#' \examples{
#' sbi$rad2deg(1)
#' sbi$rad2deg(pi) # Returns pi radians
#' sbi$rad2deg(sbi$deg2rad(360))  # Converts 360 degrees to radians and back to degrees
#' }
#' \seealso{\link[sbi:sbi_deg2rad]{sbi$deg2rad}}

#' FILE: sbi/R/rad2deg.R
sbi$rad2deg <- function (x) {
  return((x * 180) / (pi))
}

sbi_rad2deg = sbi$rad2deg

#' FILE: sbi/man/sbi_packageDependencies.Rd
#' \name{sbi$packageDpendencies}
#' \alias{sbi$packageDpendencies}
#' \alias{sbi_packageDependencies}
#' \title{display packages dependencies}
#' \description{
#'   Please use only the packages you really need. 
#'   If there is just a simple functionality try to code this yourself, for instance the [sbi$drop_na](#drop_na) functionality. So, before you install a package check what other 
#'   packages you get. If you give your script to other users, they must install all these packages as well.
#' }
#' \usage{sbi_packageDependencies(pkgName, mode='all', cran="https://ftp.belnet.be/mirror/CRAN/")}
#' \arguments{
#'   \item{pkgName}{package name given as text string}
#'   \item{mode}{which package names to return, the following modes are available:
#'                'all' - all required packages, 'install'  not yet installed packages,
#'                'nonbase' - packages not in a standard R installation,
#'               default: 'all' }
#'   \item{cran}{the default CRAN site, default: "https://ftp.belnet.be/mirror/CRAN/"}
#' }
#' \value{vector of required packages}
#' \examples{
#' sbi$packageDependencies('igraph',mode='nonbase') # not so many
#' sbi$packageDependencies('igraph',mode='all')
#' sbi$packageDependencies('tidyr',mode='nonbase')  # quite a lot!
#' sbi$packageDependencies('devtools',mode='nonbase')  # even more !
#' sbi$packageDependencies('sbi')  # myself ... should be zero!
#' }
#' \seealso{\link[sbi:sbi-package]{sbi-package}}
#' FILE: sbi/R/packageDependencies.R
sbi$packageDependencies <- function(pkgName, mode='all', cran="https://ftp.belnet.be/mirror/CRAN/")  {
    x=pkgName
    if (!interactive()) {
         r <- getOption("repos");
         r["CRAN"] <- cran
         #"https://lib.ugent.be/CRAN/" 
         options(repos=r) 
    }
    requireNamespace("tools")
    deps=package_dependencies(x,recursive=TRUE)[[1]]
    if (mode == 'install') {
        idx = which(
        !(deps %in% rownames(installed.packages())))
        return(deps[idx])
    } else if (mode == 'nonbase') {
        ipacks=installed.packages()
        bpacks=ipacks[ipacks[,'Priority'] %in% 
            c('base','recommended'),]
        rnms=setdiff(rownames(ipacks),rownames(bpacks))
        return(intersect(deps,rnms))
    } else if (mode == 'all') {
        return(deps)
    } else {
        stop('mode must be either `all`, `install` or `nonbase`!')
    }

}
sbi_packageDependencies = sbi$packageDependencies

#' FILE: sbi/man/pairwise.effect_size.Rd
#' \name{sbi$pairwise.effect_size}
#' \alias{sbi$pairwise.effect_size}
#' \alias{sbi_pairwise.effect_size}
#' \title{Pairwise effect size for larger contingency tables or for numeric vs more than two factor problems }
#' \description{
#'   The function `sbi$pairwise.effect_size` calculates the effect size for contingency tables larger. 
#'   than 2x2 returning all pairwise effect size measures btween the factor levels.
#'   The default is to use Cohen's w for contingency tables and
#'   Cohen's d for number vs factor problems with more than two factor levels.
#' }
#' \usage{sbi_pairwise.effect_size(x, y=NULL,FUN=NULL,...)}
#' \arguments{
#'   \item{x}{wither a contingency table or a numberical vector. 
#'     In the latter case y must be given.
#'   }
#'   \item{y}{in case that x is numerich, the factor variable, default: NULL}
#'   \item{FUN}{the method to be used for effect size calculation, if not given the following defaults are
#'     chosen, in case of a contingency table, Cohen's W is returned,
#'     in case of a numeric vs factor problem, the default is Cohen's d, d
#'   }
#'   \item{...}{Arguments delegated to the effect size function}
#' }
#' \value{Effect size measure}
#' \examples{ %options: fig.width=6,fig.height=4
#' # data from New Eng. J. Med. 329:297-303, 1993
#' azt=as.table(matrix(c(76,399,129,332,44,29), byrow=TRUE,ncol=2))
#' rownames(azt)=c("AZT","Placebo","Dummy")
#' colnames(azt)=c("DiseaseProgress", "NoDiseaseProgress")
#' azt
#' sbi$cohensW(t(azt[1:2,]))
#' sbi$pairwise.effect_size(t(azt))
#' sbi$pairwise.effect_size(t(azt),FUN=sbi$cohensH)
#' x=rnorm(100)
#' y=as.factor(rep(LETTERS[1:4],each=25))
#' x[1:25]=x[1:25]+1.5
#' x[26:50]=x[26:50]+0.5
#' x[50:75]=x[50:75]+0.25
#' boxplot(x~y,col="grey70")
#' sbi$cohensD(x[1:50],y=as.factor(as.character(y[1:50])))
#' sbi$pairwise.effect_size(x,y)
#' }
#' \seealso{\link[sbi:sbi-package]{sbi-package}, \link[sbi:sbi_cohensW]{sbi$cohensW}}
#' FILE: sbi/R/pairwise.effect_size.R


sbi$pairwise.effect_size <- function (x, y=NULL,FUN=NULL,...) {
    if (is.table(x)) {
        if (is.null(FUN)) {
            FUN=sbi$cohensW
        } 
        tab=x
        res=matrix(0,nrow=ncol(tab),ncol=ncol(tab))
        rownames(res)=colnames(res)=colnames(tab)
        for (i in 1:(ncol(tab)-1)) {
            for (j in i:ncol(tab)) {
                res[i,j]=res[j,i]=FUN(tab[,c(i,j)])
            }
        }
        return(res)
    } else if (is.numeric(x) & is.factor(y)) {
        if (is.null(FUN)) {
            FUN=sbi$cohensD
        } 
        res=matrix(0,nrow=length(levels(y)),ncol=length(levels(y)))
        nms=rownames(res)=colnames(res)=levels(y)
        for (i in 1:(ncol(res)-1)) {
            for (j in (i+1):ncol(res)) {
                dx=x[y %in% nms[c(i,j)]]
                dy=as.factor(as.character(y[y %in% nms[c(i,j)]]))
                res[i,j]=res[j,i]=FUN(dx,dy,...)
            }
        }
        return(res)
    } else {
        stop("Error: Either x is a contingency table or x is numeric and y is factor!")
    }
}

sbi_pairwise.effect_size = sbi$pairwise.effect_size

#' FILE: sbi/man/sbi_pca_biplot.Rd
#' \name{sbi$pca_biplot}
#' \alias{sbi$pca_biplot}
#' \alias{sbi_pca_biplot}
#' \title{Improved Biplot for PCA Objects}
#' \description{
#' The function `sbi$pca_biplot` provides an improved biplot for
#' visualizing the pairwise scores of individual principal components of 
#' an object created using the function `prcomp`. In contrast to the default 
#' biplot function  this plot visualizes the data as points and not row numbers,
#' it allows to display groups using color codes and distribution ellipses.
#' }
#' \usage{ sbi_pca_biplot(pca,pcs=c("PC1","PC2"),
#'                        pch=19,col='black',
#'                        arrows=TRUE,arrow.fac=1,
#'                        ellipse=FALSE,ell.fill=FALSE,xlab=NULL,ylab=NULL,...) }
#' \arguments{
#' \item{pca}{pca object of class `prcomp`, created using the function `prcomp`}
#' \item{pcs}{the components to plot, default: c('PC1','PC2')}
#' \item{pch}{plotting character, default: 19}
#' \item{col}{plotting color, default: black}
#' \item{arrows}{should loading arrows be displayed, default: TRUE}
#' \item{arrow.fac}{scaling factor for arrow length, default: 1}
#' \item{ellipse}{should 85 and 95 confidence intervals for the chisq distribution be shown. If this is shown colors for each group using the col argument must be given, default: FALSE}
#' \item{ell.fill}{should a filled 85 percent confidence interval be shown, colors will be used from the plotting color with opacity, default: FALSE}
#' \item{xlab}{custom xlab, if not given the PC name with variance in percent is shown, default: NULL}
#' \item{ylab}{custom ylab, if not given the PC name with variance in percent is shown, default: NULL}
#' \item{\ldots}{additional arguments delegated to the standard plot function}
#' }
#' \value{NULL}
#' \examples{ %options: fig.width=10,fig.height=5
#' par(mai=c(0.8,0.8,0.2,0.6),mfrow=c(1,2))
#' data(iris)
#' pci=prcomp(iris[,1:4],scale=TRUE)
#' sbi$pca_biplot(pci,col=rep(2:4,each=50),ellipse=TRUE,ell.fill=TRUE,
#'  arrow.fac=2.3,arrows=TRUE,main="biplot")
#' legend('topright',pch=19,col=2:4,levels(iris$Species))
#' # standard score plot
#' sbi$pca_biplot(pci,col=rep(2:4,each=50),ellipse=FALSE,
#'  arrows=FALSE,main="scoreplot")
#' }
#' 
#' FILE: sbi/R/pca_biplot.R

sbi$pca_biplot <- function (pca,pcs=c("PC1","PC2"),
                       pch=19,col='black',
                       arrows=TRUE,arrow.fac=1,
                       ellipse=FALSE,ell.fill=FALSE,xlab=NULL,ylab=NULL,...) {
    if (missing("xlab")) {
        xlab=paste(pcs[1]," (", round(summary(pca)$importance[2,pcs[1]]*100,1),"%)",sep="")
    } 
    if (missing("ylab")) {
        ylab=paste(pcs[2]," (", round(summary(pca)$importance[2,pcs[2]]*100,1),"%)",sep="")
    } 
    plot(pca$x[,pcs[1]],pca$x[,pcs[2]],pch=pch,col=col,type="n",xlab=xlab,ylab=ylab,...)
    abline(h=0,lty=2)
    abline(v=0,lty=2)    
    if (ellipse) {
        if (length(col)!= nrow(pca$x)) {
            stop("colors must have sam elength as data points")
        }
        ell.col=col
        i=1
        for (cl in names(table(ell.col))) {
            C=cov(pca$x[ell.col==cl,c(pcs[1],pcs[2])])    # Covarianz-Matrix C bestimmen
            d85=qchisq(0.85, df = 2)     # 85% - Faktor , um die Ellipse zu skalieren
            M=colMeans(pca$x[ell.col==cl,c(pcs[1],pcs[2])]) #   Mittelwerte (Zentrum) des Clusters
            el=cluster::ellipsoidPoints(C, d85, loc=M)  # Ellipsen-Punkte aus C und M berechnen
            if (ell.fill) {
                colfill=paste(rgb(t(col2rgb(cl))/255),"33",sep="")
                polygon(el,col=colfill,border=NA)
                i=i+1
                next
            }
            lines(el,col=cl,lwd=1.5,lty=2)    #  Ellipse als geschlossene Linies zeichnen
            d95=qchisq(0.95, df = 2)     # 85% - Faktor , um die Ellipse zu skalieren
            el=cluster::ellipsoidPoints(C, d95, loc=M)  # Ellipsen-Punkte aus C und M berechnen
            lines(el,col=cl,lwd=1.5,lty=1)    #  Ellipse als geschlossene Linies zeichnen                        

        }
    }
    points(pca$x[,pcs[1]],pca$x[,pcs[2]],pch=pch,col=col,...)
    if (arrows) {
        loadings=pca$rotation
        arrows(0,0,loadings[,pcs[1]]*arrow.fac,loadings[,pcs[2]]*arrow.fac,
               length=0.1,angle=20,col='black')
        text(loadings[,pcs[1]]*arrow.fac*1.2,loadings[,pcs[2]]*arrow.fac*1.2,
             rownames(loadings),col='black',font=2)
    }
}
sbi_pca_biplot = sbi$pca_biplot

#' FILE: sbi/man/sbi_pca_corplot.Rd
#' \name{sbi$pca_corplot}
#' \alias{sbi_pca_corplot}
#' \alias{sbi$pca_corplot}
#' \title{PCA Correlation plot}
#' \description{
#'   The function provides a PCA correlation plot to show associations 
#'   between PCs and variables. The closer a variable to the PC coordinate 
#'   the higher the correlation, the more away from the center of the 
#'   coordinate system, the higher the impact of the variable on this PC.
#'   You can think about the corplot as a biplot ommiting the samples and 
#'   the arrows.
#' }
#' \usage{sbi_pca_corplot(pca,pcs=c("PC1","PC2"), main="Correlation plot",cex=NULL,nvar=64,...)}
#' \arguments{
#'   \item{pca}{
#'     pca object which was created using the function \code{prcomp}.
#'   }
#'   \item{pcs}{
#'     vector of two PCs to be plotted against each other, default: c('PC1','PC2')
#'   }
#'   \item{main}{
#'     title of the plot, default: 'Correlation plot'
#'   }
#'   \item{cex}{
#'     character expansion for the samples, default: NULL (automatic calculation)
#'   }
#'   \item{nvar}{
#'     number of variables which will be displayed, for both components the variables which contributes mostly to the variances will be used, default: 64.
#'   }
#'   \item{\ldots}{
#'     remaining arguments are delegated to the standard plot function
#'   }
#' }
#' \examples{
#' par(mfrow=c(1,2),mai=c(0.7,0.7,0.5,0.1))
#' library(cluster)
#' data(votes.repub)
#' pca=prcomp(t(na.omit(votes.repub)))
#' sbi$pca_corplot(pca)
#' data(swiss)
#' pca=prcomp(swiss,scale.=TRUE)
#' sbi$pca_corplot(pca)
#' }
#' \seealso{ 
#' \code{\link[sbi:sbi-package]{sbi-package}}, \code{\link[sbi:sbi-class]{sbi-class}},
#' \code{\link[sbi:sbi_pca_biplot]{sbi$pca_biplot}}, 
#' \code{\link[sbi:sbi_pca_pairs]{sbi$pca_pairs}}, 
#' \code{\link[sbi:sbi_pca_plot]{sbi_pca_plot}}
#' }
#' FILE: sbi/R/pca_corplot.R
sbi$pca_corplot <- function (pca,pcs=c("PC1","PC2"), main="Correlation plot",cex=NULL,nvar=64,...) {
  if (is.logical(pca$scale)) {
    df=t(t(pca$x %*% t(pca$rotation)) + pca$center)
  } else {
    df=t(t(pca$x %*% t(pca$rotation)) * pca$scale + pca$center)  
  }
  xlab=paste(pcs[1]," (", round(summary(pca)$importance[2,pcs[1]]*100,1),"%)",sep="")
  ylab=paste(pcs[2]," (", round(summary(pca)$importance[2,pcs[2]]*100,1),"%)",sep="")    
  getMainLoadings = function (pca,PC="PC1",n=10) {
    return(rownames(head(pca$rotation[rev(order(abs(pca$rotation[,PC]))),],n)))
  }
  #this=dpca
  plot(1,xlim=c(-1.1,1.1),ylim=c(-1.1,1.1),pch="",
       xlab=xlab,
       ylab=ylab,
       asp=1,main=main,...)
  # library plotrix       
  draw.circle =  function (x, y, radius, nv = 100, border = NULL, col = NA, lty = 1, 
                           lwd = 1) 
  {
    xylim <- par("usr")
    plotdim <- par("pin")
    ymult <- (xylim[4] - xylim[3])/(xylim[2] - xylim[1]) * plotdim[1]/plotdim[2]
    angle.inc <- 2 * pi/nv
    angles <- seq(0, 2 * pi - angle.inc, by = angle.inc)
    if (length(col) < length(radius)) 
      col <- rep(col, length.out = length(radius))
    for (circle in 1:length(radius)) {
      xv <- cos(angles) * radius[circle] + x
      yv <- sin(angles) * radius[circle] * ymult + y
      polygon(xv, yv, border = border, col = col[circle], lty = lty, 
              lwd = lwd)
    }
    invisible(list(x = xv, y = yv))
  }
  draw.circle(0,0,1,lty=2)
  lines(c(0,0),c(1.1,-1.1),lwd=2)
  lines(c(1.1,-1.1),c(0,0),lwd=2)
  x=1
  if (length(colnames(df)>nvar)) {
    cnames=getMainLoadings(pca,pcs[1],nvar)
    cnames2=getMainLoadings(pca,pcs[2],nvar)
    cnames=unique(cnames,cnames2)
  } else {
    cnames =colnames(df)
  }
  if (is.null(cex)) {
    text.cex=0.4+4/length(cnames)
    if (text.cex > 1.2) {
      text.cex=1.2
    }
  } else {
    text.cex=cex
  }
  mcor1=c()
  mcor2=c()
  for (cname in cnames) {
    mcor1=c(mcor1,cor.test(df[,cname],pca$x[,pcs[1]])$estimate)
    mcor2=c(mcor2,cor.test(df[,cname],pca$x[,pcs[2]])$estimate)
  }
  text(mcor1,mcor2,labels=cnames,cex=text.cex)
}

sbi_pca_corplot = sbi$pca_corplot

#' FILE: sbi/man/sbi_pca_oncor.Rd
#' \name{sbi$pca_oncor}
#' \alias{sbi$pca_oncor}
#' \alias{sbi_pca_oncor}
#' \title{Perform a PCA on a Correlation matrix}
#' \description{
#'   The function `sbi$pca_oncor` does a PCA using eigenvector eigenvalue decomposition
#'   on a correlation matrix. PCA usually performs Pearson correlation internally what
#'   leads to a highly outlier sensitive analysis. If the user decides
#'   to use a method like Spearman or even bi-seriell, polychoric or for nominal data
#'   effect size measures like Cohen's W this method here can be used. Note that this
#'   does not return new coordinates for the sample as the sample contribution is lost in the
#'   correlation matrix. The method might however be used to check if the results between
#'   Pearson and Spearman PCA are similar or does  outliers lead to a completly different result.
#' }
#' \usage{ sbi_pca_oncor(x) }
#' \arguments{
#' \item{x}{a symmetric matrix usually with pairwise correlations}
#' }
#' \value{PCA like list object with components sd and rotation}
#' \examples{
#' data(USArrests)
#' C=cor(USArrests)
#' sbi$pca_oncor(C)
#' D=cor(USArrests,method="spearman") 
#' sbi$pca_oncor(D)
#' }
#' 
#' FILE: sbi/R/pca_oncor.R
sbi$pca_oncor <- function (x) {
    ev=eigen(x)
    res=list(rotation=ev$vectors,sdev=sqrt(ev$values))
    colnames(res$rotation)=paste("PC",1:ncol(x),sep="")
    rownames(res$rotation)=rownames(x)
    return(res)
             
}
sbi_pca_oncor = sbi$pca_oncor
#' FILE: sbi/man/sbi_pca_pairs.Rd
#' \name{sbi$pca_pairs}
#' \alias{sbi$pca_pairs}
#' \alias{sbi_pca_pairs}
#' \title{Improved Pairs plot for PCA objects}
#' \description{
#'   The function `sbi$pca_pairs` provides an improved pairs plot for
#'   visualizing the pairwise scores of the individual components of an analyses 
#'   using the function `prcomp`. In contrast to the default `pairs` function 
#'   this plot visualizes in the diagonal as well the variances and 
#'   a density line for the component scores.
#' }
#' \usage{ sbi_pca_pairs(pca,n=10,groups=NULL, col='black', pch=19, legend=FALSE, ...) }
#' \arguments{
#' \item{pca}{pca object which was created using the function `prcomp`.}
#' \item{n}{maximal number of components to visualize, default: 10}
#' \item{groups}{vector with classes having the same length than the inout matrix for prcomp has rows, default: NULL}
#' \item{col}{colors for the plotting, character, default: 'black'}
#' \item{pch}{plotting, symbol, default: 19}
#' \item{legend}{should the legend be displayed on top, default: FALSE}
#' \item{\ldots}{additional arguments delegated to the standard `pairs` function}
#' }
#' \value{NULL}
#' \examples{
#' data(iris)
#' pci=prcomp(iris[,1:4],scale=TRUE)
#' sbi$pca_pairs(pci,pch=15,groups=iris[,5],
#'  legend=TRUE,oma=c(5,4,4,4),col=as.numeric(iris[,5])+1)
#' }
#' 

#' FILE: sbi/R/pca_pairs.R

sbi$pca_pairs <- function (pca,n=10,groups=NULL, col='black',pch=19,legend=FALSE,...) {
    sbi$N = 1
    if (n>ncol(pca$x)) {
        n=ncol(pca$x)
    }
    pst=FALSE
    if (class(groups) != "NULL" & length(col) != length(groups)) {
        coln=length(levels(as.factor(groups)))
        cols=sbi$pastel(coln)
        col=cols[as.numeric(as.factor(as.character(groups)))]
        pst=TRUE
    }
    panel.text =function (x,...) {
        usr <- par("usr"); on.exit(par(usr=usr))
        par(usr = c(0, 1, 0, 1))
        text(0.5,0.5,
             paste(sprintf("%.1f",summary(pca)$importance[2,sbi$N]*100),"%",
                   sep=""),cex=1.5)
        ds=density(pca$x[,sbi$N],na.rm=TRUE)
        ds$x=ds$x-min(ds$x)
        ds$x=ds$x/max(ds$x)
        ds$y=(ds$y/max(ds$y)*0.3)
        polygon(ds,col='grey80')
        sbi$N = sbi$N + 1
    }
    pairs(pca$x[,1:n],diag.panel=panel.text,col=col,pch=pch,...)
    if (legend && class(groups) != "NULL") {
        opar=par()
        options(warn=-1)
        par(fig = c(0, 1, 0, 1), oma = c(0, 0, 0, 0), mar = c(0, 0, 0, 0), new = TRUE)
        plot(0, 0, type = "n", bty = "n", xaxt = "n", yaxt = "n")
        if (pst) {
            leg.cols=sbi$pastel(coln)[as.numeric(as.factor((levels(as.factor(groups)))))]
        } else {
            cols=col
            names(cols)=as.character(groups)
            lcol=cols[unique(names(cols))]
            leg.cols=as.numeric(lcol)
        }
        legend('bottom', levels(as.factor(groups)), xpd = TRUE, 
               horiz = TRUE, inset = c(0,0), 
               bty = "n", pch = pch, col = leg.cols, cex = 1.2)
        
        par(opar)
    }
}
sbi_pca_pairs = sbi$pca_pairs
#' FILE: sbi/man/sbi_pca_plot.Rd
#' \name{sbi$pca_plot}
#' \alias{sbi$pca_plot}
#' \alias{sbi_pca_plot}
#' \title{Improved Bar- or Screeplot for PCA Objects}
#' \description{
#'   The function `sbi$pca_plot` provides an improved bar- or screeplot for
#'   visualizing the variances of the individual components of an analyses 
#'   using the function _prcomp_. In contrast to the default plot function 
#'   this plot visualize cumulative and individual variances in percent.
#' }
#' \usage{ sbi_pca_plot(pca,n=10,type="bar", cex=1.5, 
#'                      legend=TRUE,xlab="Components",ylab="Variance (\%)",
#'                      pc.col=c("light blue","grey"),...)}
#' \arguments{
#' \item{pca}{pca object which was created using the function `prcomp`}
#' \item{n}{maximal number of components to visualize, default: 10}
#' \item{type}{plotting type either "bar" or "scree", default: "bar"}
#' \item{cex}{character expansion for the legend and the screeplot plotting characters, default: 1.5}
#' \item{legend}{should the legend be displayed on top, default: TRUE}
#' \item{xlab}{label for the x-axis, default "Components"}
#' \item{ylab}{label for the y-axis, default "Variances(\%)"}
#' \item{pc.col}{colors for the PC variances, first individual, second color for the cumulative variance, default: c("light blue","grey")}
#' \item{\ldots}{additional arguments delegated to the standard plot function}
#' }
#' \value{NULL}
#' \examples{ %options: fig.width=10,fig.height=5
#' data(iris)
#' par(mfrow=c(1,2))
#' pcai=prcomp(iris[,1:4],scale=TRUE)
#' sbi$pca_plot(pcai)
#' sbi$pca_plot(pcai,type="scree",legend=FALSE)
#' }
#' 
#' FILE: sbi/R/pca_plot.R
sbi$pca_plot <- function (pca,n=10,type="bar", cex=1.5, 
                     legend=TRUE,xlab="Components",ylab="Variance (%)",
                     pc.col=c("light blue","grey"),...) {
    if (n>ncol(pca$x)) {
        n=ncol(pca$x)
    }
    if (legend) {
        ylim=c(0,120)
    } else {
        ylim=c(0,105)
    }
    if (type=="bar") {
        barplot(summary(pca)$importance[3,1:n]*100,
                ylim=ylim,col='white',
                xlab=xlab,ylab=ylab,axes=FALSE,...)
    } else {
        plot(summary(pca)$importance[3,1:n]*100,type="b",
                ylim=ylim,cex.axis=1.2,lwd=2,cex=cex,
                xlab=xlab,ylab=ylab,axes=FALSE,
                pch=15,col=pc.col[2],...)
        points(summary(pca)$importance[2,1:n]*100,type="b",cex=cex,
                lwd=2,xlab="", pch=15,col=pc.col[1],...)

        axis(1,at=1:n,labels=paste("PC",1:n,sep=""))
    }
    axis(2,at=c(20,40,60,80,100),labels=c(20,40,60,80,100))
    if (type == "bar") {
        barplot(summary(pca)$importance[3,1:n]*100,add=TRUE,col=pc.col[2],axes=FALSE)
        barplot(summary(pca)$importance[2,1:n]*100,add=TRUE,col=pc.col[1],axes=FALSE)        
    }
    abline(h=5,lty=2,lwd=0.5)
    abline(h=10,lty=2,lwd=0.5)
    abline(h=90,lty=2,lwd=0.5)
    abline(h=95,lty=2,lwd=0.5)    
    abline(h=100,lty=1,lwd=0.5)    
    if (legend) {
        legend("topleft",c("Component","Cumulative"),col=pc.col,pch=15,cex=1.5,box.lwd=0,ncol=2)
    }
    box()
}
sbi_pca_plot = sbi$pca_plot

#' FILE: sbi/man/sbi_pca_to_data.Rd
#' \name{sbi$pca_to_data}
#' \alias{sbi$pca_to_data}
#' \alias{sbi_pca_to_data}
#' \title{Transform prcomp PCA Objects  back to Data}
#' \description{
#'   The method allows you transform PCA data back to original data. 
#'   This can be as well used to eliminate some components and then create
#'   data by removing the effect of these components.
#' }
#' \usage{sbi_pca_to_data(pca)}
#' \arguments{
#'   \item{pca}{
#'     pca object of class prcomp
#'   }
#' }
#' \value{return data matrix with the original data}
#' \examples{
#' pca=prcomp(iris[,1:4])
#' head(iris[,1:4])
#' head(sbi$pca_to_data(pca))
#' # remove effect of first component
#' pca$rotation[,1]=0
#' head(sbi$pca_to_data(pca))
#' }
#' \seealso{ 
#' \code{\link[sbi:sbi-package]{sbi-package}},
#' \code{\link[sbi:sbi_pca_biplot]{sbi$pca_biplot}}, 
#' \code{\link[sbi:sbi_pca_corplot]{sbi$pca_corplot}}, 
#' \code{\link[sbi:sbi_pca_pairs]{sbi$pca_pairs}},
#' \code{\link[sbi:sbi_pca_plot]{sbi$pca_plot}},
#' \code{\link[sbi:sbi_pca_variances]{sbi$pca_variances}},
#' \code{\link[sbi:sbi_pca_varplot]{sbi$pca_varplot}}
#' }
#' FILE: sbi/R/pca_to_data.R
sbi$pca_to_data <- function (pca) {
  if (!is.logical(pca$scale)) {
    data=t(t(pca$x %*% t(pca$rotation)) * pca$scale + pca$center)   
  } else {
    data=t(t(pca$x %*% t(pca$rotation)) + pca$center)
  }
  return(data)
}

sbi_pca_to_data = sbi$pca_to_data


#' FILE: sbi/man/sbi_pca_variances.Rd
#' \name{sbi_pca_variances}
#' \alias{sbi$pca_variances}
#' \alias{sbi_pca_variances}
#' \title{Absolute Variance contributions of Variables to PC's}
#' \description{
#'   The function returns the absolute variance contributions for each variable to each component.
#'   Every squared loading value for each component and variable  is multiplied
#'   with the component importance. The sum of the returned matrix is therefor 1.
#' }
#' \usage{sbi_pca_variances(pca)}
#' \arguments{
#'   \item{pca}{
#'     a PCA object created with `prcomp`.
#'   }
#' }
#' \value{return matrix with absolute variances for each component and variable.}
#' \examples{
#' pca=prcomp(USArrests,scale=TRUE)
#' round(sbi$pca_variances(pca),2)
#' sum(sbi$pca_variances(pca))
#' }
#' \seealso{ 
#' \code{\link[sbi:sbi-package]{sbi-package}}, \code{\link[sbi:sbi-class]{sbi-class}},
#' \code{\link[sbi:sbi_pca_biplot]{sbi$pca_biplot}}, 
#' \code{\link[sbi:sbi_pca_corplot]{sbi$pca_corplot}}, 
#' \code{\link[sbi:sbi_pca_pairs]{sbi$pca_pairs}},
#' \code{\link[sbi:sbi_pca_plot]{sbi$pca_plot}},
#' \code{\link[sbi:sbi_pca_to_data]{sbi$pca_to_data}},
#' \code{\link[sbi:sbi_pca_varplot]{sbi$pca_varplot}}
#' }
#' FILE: sbi/R/pca_variances.R
sbi$pca_variances = function (pca) {
  imp=summary(pca)$importance[2,]
  var= summary(pca)$rotation[,]^2
  for (i in 1:ncol(var)) { var[,i]=var[,i]*imp[i] }
  return(var)
}

sbi_pca_variances = sbi$pca_variances

#' FILE: sbi/man/sbi_pca_varplot.Rd
#' \name{sbi_pca_varplot}
#' \alias{sbi$pca_varplot}
#' \alias{sbi_pca_varplot}
#' \title{PCA Variance plot}
#' \description{
#'   The function provides a PCA matrix plot to show associations 
#'   between PCs and variables. Shown are the squared values, but retaining the 
#'   original sign of the the variances. So the abolute sum of all values should be one.
#' }
#' \usage{sbi_pca_varplot(pca, pcs=10, main="Variance plot", cex.lab=1.5, cex.sym=8, 
#'         cex.var=1, pch=16, ...)}
#' \arguments{
#'   \item{pca}{
#'     pca object which was created using the function \code{prcomp}
#'   }
#'   \item{pcs}{
#'     number of the first PC's or vector of PC names to be plotted, default: 10 (or max number of PC's)
#'   }
#'   \item{main}{
#'     title of the plot, default: 'Variance plot'
#'   }
#'   \item{cex.lab}{
#'     character expansion for column and rownames, default: 1.5
#'   }
#'   \item{cex.sym}{
#'     character expansion for the plotting symbols, default: 8
#'   }
#'   \item{cex.var}{
#'     character expansion for the variance values, default: 1
#'   }
#'   \item{pch}{
#'     plotting character for the variances, default: 16 (filled circle)
#'   }
#'   \item{\ldots}{
#'     remaining arguments are delegated to the standard plot function
#'   }
#' }
#' \examples{
#' data(USArrests)
#' sbi$pca_varplot(prcomp(USArrests,scale=TRUE),cex.sym=8)
#' data(swiss)
#' pca=prcomp(swiss,scale=TRUE)
#' round(sbi$pca_variances(pca),3)
#' sbi$pca_varplot(pca,cex.sym=5,cex.var=0.7,cex.lab=1)
#' }
#' \seealso{ 
#' \code{\link[sbi:sbi-package]{sbi-package}}, \code{\link[sbi:sbi-class]{sbi-class}},
#' \code{\link[sbi:sbi_pca_biplot]{sbi$pca_biplot}}, 
#' \code{\link[sbi:sbi_pca_corplot]{sbi$pca_corplot}}, 
#' \code{\link[sbi:sbi_pca_pairs]{sbi$pca_pairs}},
#' \code{\link[sbi:sbi_pca_plot]{sbi$pca_plot}},
#' \code{\link[sbi:sbi_pca_to_data]{sbi$pca_to_data}},
#' \code{\link[sbi:sbi_pca_variances]{sbi$pca_varplot}}
#' }
#' FILE: sbi/R/pca_varplot.R
sbi$pca_varplot = function (pca,pcs=10,main="Variance plot",
                              cex.lab=1.5,cex.sym=8, cex.var=1, pch=16,
                              ...) {
  vars=sbi$pca_variances(pca)
  pcar=summary(pca)$rotation
  if (class(pcs)=="numeric") {
    if (pcs>ncol(vars)) {
      pcs=ncol(vars)
    }
    vars=vars[,1:pcs]
  } else {
    vars=vars[,pcs]
  }
  mt=vars
  yend=nrow(mt)+1
  xend=ncol(mt)+1
  plot(1,type="n",xlab="",ylab="",axes=FALSE,
       xlim=c(-0.5,xend),ylim=c(nrow(mt)+0.35,0),...)
  text(1:(ncol(mt)),0.25,colnames(mt),cex=cex.lab)
  text(-0.5,1:nrow(mt),rownames(mt),cex=cex.lab,pos=4)
  cols=paste("#DD3333",rev(c(15,30, 45, 60, 75, 90, "AA","BB","CC","DD")),sep="")
  cols=c(cols,paste("#3333DD",c(15,30, 45, 60, 75, 90, "AA","BB","CC","DD"),sep=""))
  breaks=seq(-1,1,by=0.1)                  
  mt[pcar<0]=mt[pcar<0]*-1                      
  for (i in 1:nrow(mt)) {
    for (j in 1:ncol(mt)) {
      coli=cut(mt[j,i],breaks=breaks,labels=1:20)
      points(i,j,pch=pch,cex=cex.sym,col=cols[coli])
      text(x=j,y=i,label=sprintf("%0.2f",mt[i,j],2),cex=cex.var)
    }
  }
}

sbi_pca_varplot = sbi$pca_varplot


#' FILE: sbi/man/sbi_pastel.Rd
#' \name{sbi$pastel}
#' \alias{sbi$pastel}
#' \alias{sbi_pastel}
#' \title{Create up to 20 pastel colors}
#' \description{Create a vector of pastel colors.}
#' \usage{sbi_pastel(n)}
#' \arguments{
#'   \item{n}{Number of colors requested, must be between 1 and 20.}
#' }
#' \details{
#' This function generates a sequence of up to 20 pastel colors for R versions earlier than 3.6 where \code{hcl.colors} may not be available.
#' }
#' \value{A vector of pastel colors.}
#' \examples{
#' sbi$pastel(4)
#' par(mai=c(0.2,0.2,0.2,0.1))
#' plot(1:20, col=sbi$pastel(20), cex=3, pch=15)
#' }
#' \seealso{\link[sbi:sbi-package]{sbi-package}}
#' FILE: sbi/R/pastel.R
sbi$pastel <- function (n) {
  if (n > 20 || n < 1) {
    stop("only between 1 and 20 colors can be given")
  }
  pcols <- c(
    "#FFC5D0", "#FDC8C3", "#F6CBB7", "#EDD0AE", "#E2D4A8", "#D4D8A7", 
    "#C5DCAB", "#B6DFB4", "#A8E1BF", "#9EE2CB", "#99E2D8", "#9BE0E5", 
    "#A4DDEF", "#B3D9F7", "#C4D5FB", "#D5D0FC", "#E4CBF9", "#F0C7F2", 
    "#F9C5E9", "#FEC4DD"
  )
  idx <- seq(1, 20, by = floor(20 / n))
  return(pcols[idx])
}

sbi_pastel = sbi$pastel


#' FILE: sbi/man/report_pval.Rd
#' \name{sbi$report_pval}
#' \alias{sbi$report_pval}
#' \alias{sbi_report_pval}
#' \title{Report P-value with Significance stars}
#' \description{Convert p-value into a string with significance stars.}
#' \usage{sbi_report_pval(p, star=TRUE)}
#' \arguments{
#'   \item{p}{numeric; p-value.}
#'   \item{star}{logical; should stars be shown for significance levels, default: TRUE.}
#' }
#' \details{
#' The function converts p-values into strings, and if \code{star = TRUE}, adds stars to indicate significance levels.
#' }
#' \value{A character string with the p-value and optional significance stars.}
#' \examples{
#' sbi$report_pval(0.03)
#' sbi$report_pval(0.0001)
#' sbi$report_pval(0.3)
#' }
#' \seealso{\link[sbi:sbi-package]{sbi-package}}
#' FILE: sbi/R/report_pval.R
sbi$report_pval <- function (p, star=TRUE) {
  if (star) {
    if (p < 0.001) {
      return("***")
    } else if (p < 0.01) {
      return("**")
    } else if (p < 0.05) {
      return("*")
    } else {
      return("")
    }
  } else {
    return(sprintf("p = %.4f", p))
  }
}

sbi_report_pval = sbi$report_pval

#' FILE: sbi/man/sbi_sdata.Rd
#' \name{sbi$sdata}
#' \alias{sbi$sdata}
#' \alias{sbi_sdata}
#' \title{Retrieve small data sets}
#' \description{Retrieve small data sets for analysis.}
#' \usage{sbi_sdata(name)}
#' \arguments{
#'   \item{name}{The name of the data set. Currently supported: 'c20' (relation between
#'     unsaturated fatty acids and insulin sensitivity) and 'azt' (treatment data for HIV patients).
#'   }
#' }
#' \details{
#' The following data sets are supported:
#' \describe{
#'   \item{\code{c20}}{Data set illustrating the relationship between unsaturated fatty acids and insulin sensitivity (Borkman et al., 1993).}
#'   \item{\code{azt}}{Treatment data for HIV patients comparing AZT against placebo (Cooper et al., 1993).}
#'   \item{\code{decathlon}}{Data from the 1988 olympics decathlon, distance results (100m, 110m hurdles, 400m and 1500m) are given in km/hour not in seconds}
#' }
#' }
#' \references{
#'   \itemize{
#'     \item Borkman, M., et al. (1993). The relation between insulin sensitivity and the fatty-acid composition of skeletal-muscle phospholipids. \emph{New England Journal of Medicine}, 328(4), 238-244.
#'     \item Cooper, D. A., et al. (1993). Zidovudine in persons with asymptomatic HIV infection and CD4+ cell counts greater than 400 per cubic millimeter. \emph{New England Journal of Medicine}, 329(5), 297-303.
#'   }
#' }
#' \value{A data frame or contingency table for the selected data set.}
#' \examples{
#' c20 <- sbi$sdata(name = "c20")
#' head(c20)
#' cor(c20[, 1], c20[, 2])
#' sbi$lmplot(c20[, 1], c20[, 2], ylim = c(0, 600), xlim = c(17, 25))
#' azt <- sbi$sdata(name = "azt")
#' azt
#' dec <- sbi$sdata(name = "decathlon")
#' dim(dec)
#' head(dec)
#' }
#' \seealso{\link[sbi:sbi-package]{sbi-package}}
#' FILE: sbi/R/sdata.R
sbi$sdata <- function (name="c20") {
  if (name == "c20") {
    c20.22=c(17.9, 18.3, 18.3, 18.4, 18.4, 20.2, 20.3, 21.8, 21.9, 22.1, 23.1, 24.2, 24.4)
    ins.sens=c(250, 220, 145, 115, 230, 200, 330, 400, 370, 260, 270, 530, 375)
    data = data.frame(c20.22 = c20.22, ins.sens = ins.sens)
    return(data)
  } else if (name == "azt") {
    aids.azt = as.table(matrix(c(76, 399, 129, 332), byrow = TRUE, ncol = 2))
    rownames(aids.azt) = c("AZT", "Placebo")
    colnames(aids.azt) = c("DiseaseProgress", "NoDiseaseProgress")
    dimnames(aids.azt) = list("Treatment" = dimnames(aids.azt)[[1]], "Progress" = dimnames(aids.azt)[[2]])
    return(aids.azt)
  } else if (name == "decathlon") {
      file_path <- system.file("files", "decathlon.tab", package = "sbi") 
      data=read.table(file_path,sep="\t",header=TRUE)
      return(data)
  } else {
    stop("Error: Currently only 'c20', 'azt' and 'decathlon', datasets are supported!")
  }
}
sbi_sdata = sbi$sdata

#' FILE: sbi/man/sem.Rd
#' \name{sbi$sem}
#' \alias{sbi$sem}
#' \alias{sbi_sem}
#' \title{Calculate the Standard Error of the Mean for a numerical Vector}
#' \description{
#'   The function calculates the standard error of the mean which shows how close
#'    we are to the population mean.
#'    The formula of the SEM is: sd/sqrt(n).
#' }
#' \usage{sbi_sem(x, na.rm=FALSE)}
#' \arguments{
#'   \item{x}{numeric vector}
#'   \item{na.rm}{remove missing values, default: FALSE}
#' }
#' \value{computed standard error of the mean}
#' \examples{
#' sem=sbi$sem
#' sem(rnorm(50,mean=10,sd=3))
#' sem(rnorm(1000,mean=10,sd=3))
#' }
#' \seealso{\link[sbi:sbi-package]{sbi-package}}
#' FILE: sbi/R/sem.R

sbi$sem <- function(x,na.rm=FALSE) {
    sd(x,na.rm=na.rm)/sqrt(length(x[!is.na(x)])) 
}

sbi_sem = sbi$sem

#' FILE: sbi/man/sbi_shape.Rd
#' \name{sbi$shape}
#' \title{Create Polygon shapes centered at given x and y Coordinates}
#' \alias{sbi$shape}
#' \alias{sbi_shape}
#' \description{Function which returns random polygon shapes.}
#' \usage{sbi_shape(x=0,y=0,width=1,height=1,type="circle", 
#'                  seed=17, dir="left", arrow=FALSE, ...)}
#' \arguments{
#'   \item{x}{horizontal center of shape, default: 0}
#'   \item{y}{vertical center of shape, default: 0}
#'   \item{width}{the shape width, default: 1}
#'   \item{height}{the shape height, default: 1}
#'   \item{type}{the shape type, either 'circle', 'diamond', 'hexagon', 'octagon' or 'rand', default: 'circle'}
#'   \item{seed}{set a seed for a random polygon, default: 17}
#'   \item{dir}{for some shapes such as pentagon a direction, default: 'left'}
#'   \item{arrow}{for some shapes such as pentagon or hexagon a boolean to change to a more arrow like style, default: FALSE}
#'   \item{...}{arguments forwarded to the function data.spline}
#' }
#' \value{polygon as list of x and y coordinates}
#' \examples{ %options: fig.width=9,fig.height=9
#' par(mfrow=c(2,2),mai=rep(0.5,4))
#' plot(1,xlim=c(-1,1.5),ylim=c(-1,1.5),axes=TRUE,xlab="",ylab="",type="n")
#' grid()
#' polygon(sbi$shape(-0.5,-0.5,type="circle",width=0.3,height=0.3),col="skyblue")
#' polygon(sbi$shape(0,-0.5,type="rand",width=0.3,height=0.3),col="skyblue")
#' polygon(sbi$shape(0.5,-0.5,type="rand",width=0.3,height=0.3,seed=19),col="salmon")
#' polygon(sbi$shape(-0.5,0,type="circle",width=0.4,height=0.2),col="cornsilk")
#' polygon(sbi$shape(0,0,type="rect",width=0.3,height=0.2),col="cornsilk")
#' polygon(sbi$shape(0.5,0,type="rect",width=0.2,height=0.2),col="cornsilk")
#' polygon(sbi$shape(-0.5,0.5,type="hexagon",width=0.4,height=0.2),col="cornsilk")
#' polygon(sbi$shape(0,0.5,type="diamond",width=0.4,height=0.2),col="bisque")
#' polygon(sbi$shape(0.5,0.5,type="octagon",width=0.4,height=0.2),col="bisque")
#' polygon(sbi$shape(-0.5,1,type="pentagon",width=0.4,height=0.2),col="bisque")
#' polygon(sbi$shape(0,1,type="pentagon",width=0.4,height=0.2,dir="right"),col="bisque")
#' polygon(sbi$shape(0.5,1,type="pentagon",width=0.4,height=0.2,dir="right",arrow=TRUE),col="bisque")
#' polygon(sbi$shape(1,1,type="hexagon",width=0.4,height=0.2,dir="right",arrow=TRUE),col="cornsilk")
#' polygon(sbi$shape(1,0.5,type="hexagon",width=0.4,height=0.2,arrow=TRUE),col="cornsilk")
#' plot(1,xlim=c(-1,1),ylim=c(-1,1),axes=FALSE,xlab="",ylab="",type="n")
#' for (i in 1:20) {
#'    col=colors()[sample(2:50,1)]
#'    x=runif(1,min=-0.8,max=0.8)
#'    y=runif(1,min=-0.8,max=0.8)
#'    polygon(sbi$shape(x,y,type="rand",width=0.25,height=0.25,
#'       seed=20+i),col=col,border=col)
#'    text(x,y,20+i,col="white")
#' }
#' # chessboard
#' par(mai=rep(0.2,4))
#' plot(1,xlim=c(-0.5,9.5),ylim=c(-0.5,9.5),axes=FALSE,xlab="",ylab="",type="n")
#' cols=c(rep(c("burlywood3","bisque"),4),rep(c("bisque","burlywood3"),4))
#' c=0
#' polygon(sbi$shape(4.5,4.5,type="rect",width=10,height=10),col="burlywood3")
#' polygon(sbi$shape(4.5,4.5,type="rect",width=9.8,height=9.8),col="bisque2",border="burlywood3",lwd=4)
#' for (col in 1:8) {
#'    for (row in 1:8) {
#'       c=c+1
#'       polygon(sbi$shape(col,row,type="rect",width=1,height=1),col=cols[c])
#'       if (c==16) { c = 0 }
#'    }
#' }
#' text(1:8,rep(0,8),LETTERS[1:8],cex=1.5)
#' text(rep(0,8),1:8,1:8,cex=1.5)
#' text(1:8,1,c("\u2656","\u2658","\u2657","\u2655",
#'              "\u2654","\u2657","\u2658","\u2656"),cex=3)
#' text(1:8,2,rep("\u2659",8),cex=3)
#' text(1:8,7,rep("\u265F",8),cex=3)
#' text(1:8,8,c("\u265C","\u265E","\u265D","\u265B",
#'              "\u265A","\u265D","\u265E","\u265C"),cex=3)
#' # Go board
#' plot(1,xlim=c(0,20),ylim=c(0,20),axes=FALSE,xlab="",ylab="",type="n")
#' polygon(sbi$shape(10,10,type="rect",width=20.5,height=20.5),col="burlywood3")
#' polygon(sbi$shape(10,10,type="rect",width=19.5,height=19.5),col="bisque2",border="burlywood3",lwd=4)
#' # grid
#' res=lapply(1:19, function (x) lines(c(x,x),c(1,19),lwd=1))
#' res=lapply(1:19, function (x) lines(c(1,19),c(x,x),lwd=1))
#' # markers
#' for (i in c(5,10,15)) {
#'     for (j in c(5,10,15)) {
#'        polygon(sbi$shape(i,j,type="circle",width=0.3,height=0.3),col="black")
#'     }
#' }
#' # some stones
#' set = function(x,y,col="black") {
#'     w=0.9
#'     if (col=="white") {
#'        w=0.95
#'     }
#'     polygon(sbi$shape(x,y,type="circle",width=w,height=w),col=col,border="grey20")
#' }
#' set(3,4,"black")
#' set(5,3,"white")
#' set(16,3,"black")
#' set(16,15,"white")
#' set(4,16,"black")
#' text(3,14,"X",cex=2) # set suggestion
#' }
#' \seealso{\link[sbi:sbi-package]{sbi-package}}

#' FILE: sbi/R/shape.R

sbi$shape <- function (x=0,y=0,width=1,height=1,type="circle",
                       seed=17,dir="left", arrow=FALSE,...) {
    circle = function(x,y, radius=1,length=100) {
        theta = seq(0, 2 * pi, length = 100) 
        return(list(x=radius*cos(theta)+x,
                    y=radius*sin(theta)+y))
    }
    # https://gis.stackexchange.com/questions/24827/smoothing-polygons-in-contour-map/24929#24929
    randPoly = function(n=6,seed=17) {
        set.seed(seed)
        n.vertices <- 10
        theta <- (runif(n.vertices) + 1:n.vertices - 1) * 2 * pi / n.vertices
        r <- rgamma(n.vertices, shape=3)
        xy <- cbind(cos(theta) * r, sin(theta) * r)
        xy=spline.poly(xy)
        return(list(x=xy[,1],y=xy[,2]))
    }
    # Splining a polygon.
    #
    #   The rows of 'xy' give coordinates of the boundary vertices, in order.
    #   'vertices' is the number of spline vertices to create.
    #              (Not all are used: some are clipped from the ends.)
    #   'k' is the number of points to wrap around the ends to obtain
    #       a smooth periodic spline.
    #
    #   Returns an array of points. 
    # 
    spline.poly = function(xy, vertices=100, k=3, ...) {
        # Assert: xy is an n by 2 matrix with n >= k.
        
        # Wrap k vertices around each end.
        n <- dim(xy)[1]
        if (k >= 1) {
            data <- rbind(xy[(n-k+1):n,], xy, xy[1:k, ])
        } else {
            data <- xy
        }
        
        # Spline the x and y coordinates.
        data.spline <- spline(1:(n+2*k), data[,1], n=vertices, ...)
        x <- data.spline$x
        x1 <- data.spline$y
        x2 <- spline(1:(n+2*k), data[,2], n=vertices, ...)$y
        # Retain only the middle part.
        cbind(x1, x2)[k < x & x <= n+k, ]
    }
    center = function(poly) {
        poly$x=poly$x-mean(poly$x)
        poly$x=poly$x/diff(range(poly$x))
        poly$y=poly$y-mean(poly$y)
        poly$y=poly$y/diff(range(poly$y))
        return(poly)
    }
    if (substr(type,1,4) == "circ") {
        poly=circle(0,0,radius=1)
    } else if (type == "rand") {
        poly=randPoly(seed=seed) 
    } else if (type %in% c("rect","rectangle")) {
        poly=list(x=c(-0.5,0.5,0.5,-0.5),
                  y=c(-0.5,-0.5,0.5,0.5))
    } else if (type == "diamond") {
        poly=list(x=c(-0.5,  0,   0.5,0  ),
                  y=c( 0  , -0.5, 0.0,0.5))
    } else if (type == "hexagon") {
        poly=list(x=c(-0.5,-0.3,+0.3,+0.5,+0.3,-0.3),
                  y=c(+0.0,-0.5,-0.5,+0.0,+0.5,+0.5))
        if (arrow) {
            poly$x[1]=-0.05
        }
        if (dir == "right") {
            poly$x=poly$x*-1
        }
    } else if (type == "octagon") {
        poly=list(x=c(-0.5,-0.5,-0.3,0.3,0.5,0.5,0.3,-0.3),
                  y=c(0.25,-0.25,-0.5,-0.5,-0.25,+0.25,0.5,0.5))
    } else if (type == "pentagon") {
        poly=list(x=c(-0.5,-0.25,0.5,0.5,-0.25),
                  y=c(0,0.5,0.5,-0.5,-0.5))
        if (arrow) {
            poly$y[3]=0.25
            poly$y[4]=-0.25
        }
        if (dir == "right") {
            poly$x=poly$x*-1
        }
    } else {
        stop("Error: Unkown type '",type,"'!",sep="")
    }
    poly=center(poly)
    poly$x=poly$x*width+x
    poly$y=poly$y*height+y
    return(poly)
}

sbi_shape = sbi$shape

#' FILE: sbi/man/sbi_skewness.Rd
#' \name{sbi$skewness}
#' \alias{sbi$skewness}
#' \alias{sbi_skewness}
#' \title{third central moment of a distribution}
#' \description{
#'   Calculate the third central moment of a distribution. Values higher than zero
#'   indicate right-tailed distributions, values of lower than zero mean 
#'   left-tailed distributions. Values around zero mean normal value
#'   like distribution. 
#' }
#' \usage{sbi_skewness(x, na.rm=FALSE)}
#' \arguments{
#'   \item{x}{vector with positive numerical values}
#'   \item{na.rm}{should NA's be removed, default: FALSE}
#' }
#' \value{numerical value for the skewness of the vector}
#' \examples{
#' sbi$skewness(1:100)          # very uniform, 0
#' sbi$skewness(rnorm(100))     # normal, close to 0
#' # now with right tail
#' sbi$skewness(c(rnorm(100,mean=20),rnorm(30,mean=23,sd=2)))
#' }
#' \seealso{\link[sbi:sbi-package]{sbi-package}, \link[sbi:sbi_kurtosis]{sbi$kurtosis}}
#' FILE: sbi/R/skewness.R
sbi$skewness <- function (x,na.rm=FALSE) {
    if (na.rm) {
        x=x[!is.na(x)]
    } else {
        if (any(is.na(x))) {
            return(NA)
        }
    }
    g=(sum((x-mean(x,na.rm=na.rm))^3)/
       length(x))/(sd(x)^3)
    return(g)
}

sbi_skewness <- sbi$skewness

#' FILE: sbi/man/sbi_shell.Rd
#' \name{sbi$shell}
#' \alias{sbi$shell}
#' \alias{sbi_shell}
#' \title{executes a given shell script in text format (Unix only)}
#' \description{
#'   This function can be used to execute shell script text and embed the output in the
#'   current document.
#' }
#' \usage{sbi_shell(script,filename="shell-script.sh")}
#' \arguments{
#'   \item{script}{text of a shell script}
#'   \item{filename}{the script filename, default: "shell-script.sh"}
#' }
#' \value{The script output printed to stdout}
#' \details{
#'  Typical application examples of this function are the embedding of diagram
#'  code or database output if tools like sqlite3, GraphViz dot, PlantUML or fossil
#'  are installed locally. In contrast to the 'sbi$kroki' function in this case no 
#'  internet connection is required. This code is tested on Unix systems like Linux
#'  and MacOS only. Windows with Unix like shells Msys2 or Cygwin might work as well
#'  but are untested.
#' }
#' \examples{ %options eval=FALSE
#' \dontrun{
#' ### The resulting png file can be embedded using standard Markdown syntax
#' sbi$shell("#!/usr/bin/env -S dot -Tpng -odot.png
#' digraph G {
#' rankdir=LR;
#'   node[style=filled,fillcolor=skyblue];
#'   a -> b [arrowhead=none];
#'   b -> c [arrowhead=none];
#'   c -> d [arrowhead=none];
#'   a [shape=rpromoter,label=\"UAS\",fillcolor=salmon];
#'   b [shape=rectangle,label=\"LacI\"];
#'   c [shape=rpromoter,label=\"UAS\",fillcolor=salmon];
#'   d [shape=rectangle,label=\"Reporter\"];
#'   }
#'  ")
#'  }
#' }
#' \seealso{\link[sbi:sbi-package]{sbi-package}, \link[sbi:sbi_kroki]{sbi$kroki}.}
#' FILE: sbi/R/shell.R
sbi$shell <- function (script,filename="shell-script.sh") {
    fout = file(filename,'w')
    cat(script,"\n",file=fout)
    close(fout)
    system(sprintf("chmod 755 %s",filename))
    res=system(sprintf("./%s\n",filename))
    return(res)
}
sbi_shell <- sbi$shell

#' FILE: sbi/man/sbi_smartbind.Rd
#' \name{sbi$smartbind}
#' \alias{sbi$smartbind}
#' \alias{sbi_smartbind}
#' \title{Bind two Data frames by matching Column names}
#' \description{Bind two data frames by matching column names, filling in missing columns with NAs.}
#' \usage{sbi_smartbind(x, y)}
#' \arguments{
#'   \item{x}{A data frame or matrix.}
#'   \item{y}{A data frame or matrix.}
#' }
#' \details{
#' This function takes two data frames (or matrices) and combines them, ensuring that columns are matched by name. Columns that don't exist in one data frame are filled with \code{NA}.
#' }
#' \value{A data frame or matrix with combined rows of \code{x} and \code{y}.}
#' \examples{
#' df1 <- data.frame(a = 1:3, b = 4:6)
#' df2 <- data.frame(b = 7:9, c = 10:12)
#' sbi$smartbind(df1, df2)
#' }
#' \seealso{\link[sbi:sbi-package]{sbi-package}}
#' FILE: sbi/R/smartbind.R
sbi$smartbind <- function (x, y) {
  nxcols <- setdiff(colnames(y), colnames(x))
  nycols <- setdiff(colnames(x), colnames(y))
  for (c in nxcols) {
    x <- cbind(x, ncol = rep(NA, nrow(x)))
    colnames(x)[ncol(x)] <- c
  }
  for (c in nycols) {
    y <- cbind(y, ncol = rep(NA, nrow(y)))
    colnames(y)[ncol(y)] <- c
  }
  y <- y[, colnames(x)]
  x <- rbind(x, y)
  return(x)
}
sbi_smartbind <- sbi$smartbind

#' FILE: sbi/man/sbi_textplot.Rd
#' \name{sbi$textplot}
#' \alias{sbi$textplot}
#' \alias{sbi_textplot}
#' \title{Display a Data frame or a Matrix in a Plot}
#' \description{Write the data for a data frame or matrix into a plot.}
#' \usage{sbi_textplot(x, cex=1, caption=NULL, ...)}
#' \arguments{
#'   \item{x}{A data frame or matrix.}
#'   \item{cex}{Character expansion factor for text size, default: \code{1}.}
#'   \item{caption}{An optional caption to display below the table, default: \code{NULL}.}
#'   \item{...}{Other arguments passed to the \code{plot} function.}
#' }
#' \details{
#' This function can be used as a workaround to display data for small data frames or matrices within a plot.
#' }
#' \value{NULL}
#' \examples{
#' par(mai=rep(0.1,4))
#' sbi$textplot(head(swiss), caption="Table 1: Swiss data first six lines")
#' }
#' \seealso{\link[sbi:sbi-package]{sbi-package}}
#' FILE: sbi/R/textplot.R

sbi$textplot <- function (x, cex = 1, caption = NULL, ...) {
  xlim <- c(-0.5, ncol(x) + 0.5)
  ylim <- c(0, nrow(x) + 1.4)
  if (!is.null(caption)) {
    ylim[1] <- -1
  }
  plot(1, type = "n", xlim = xlim, ylim = ylim, axes = FALSE, xlab = "", ylab = "", ...)
  if (!is.null(caption)) {
    text(mean(xlim), -0.6, caption, cex = cex * 1.2)
  }
  abline(h = nrow(x) + 1.5, lwd = 2)
  abline(h = nrow(x) + 0.6, lwd = 2)
  abline(h = 0.3, lwd = 2)
  for (i in 1:nrow(x)) {
    text(-0.5, nrow(x) + 1 - i, rownames(x)[i], cex = cex, adj = 0)
    for (j in 1:ncol(x)) {
      if (i == 1) {
        text(j, nrow(x) + 1, colnames(x)[j], cex = cex)
      }
      text(j, nrow(x) + 1 - i, x[i, j], cex = cex)
    }
  }
}
sbi_textplot <- sbi$textplot

#' FILE: sbi/man/sbi_untab.Rd
#' \name{sbi$untab}
#' \alias{sbi$untab}
#' \alias{sbi_untab}
#' \title{Convert a Contingency table to a Data frame one Item per Row}
#' \description{
#'   This function takes a contingency table and expands it two a data frame
#'   where every level combination is created according to the number of entries in the
#'   contingency table. You can reverse the process using the table command. The procedure is useful for
#'   instance for performing sample bootstrapping.
#' }
#' \usage{sbi_untab(x)}
#' \arguments{
#'   \item{x}{a contingency table or a matrix}
#' }
#' \value{data frame with two columns, column names are either the dimnames of the given table or
#'             generic columnames like 'rowvar' and 'colvar'}
#' \examples{
#' M=matrix(c(4,3,1,2),ncol=2,dimnames=list(
#'          size=c('small','tall'),
#'         smoking=c('no','yes')))
#' M
#' N=sbi$untab(M)
#' head(N)
#' summary(N)
#' table(N[,1],N[,2])
#' }
#' \seealso{\link[sbi:sbi-package]{sbi-package}}
#' FILE: sbi/R/untab.R

sbi$untab <- function (x) {
    tab=x
    nms=names(dimnames(tab))
    if (any(is.null(nms)))
    nms=c('rowvar','colvar')
    df=data.frame(a=c(),b=c())
    for (i in 1:nrow(tab)) {
        for (j in 1:ncol(tab)) {
            if (tab[i,j]> 0) {
                for (k in 1:tab[i,j]) {
                    if (nrow(df)==0) {
                        df=data.frame(vrow=rownames(tab)[i],vcol=colnames(tab)[j])
                    } else {
                        df=rbind(df,data.frame(vrow=rownames(tab)[i],vcol=colnames(tab)[j]))
                    }
                }
            }
        }
    }   
    df[,1]=as.factor(df[,1])
    df[,2]=as.factor(df[,2])
    colnames(df)=nms
    return(df)
}

sbi_untab <- sbi$untab

#' FILE: sbi/man/sbi_venn.Rd
#' \name{sbi$venn}
#' \alias{sbi$venn}
#' \alias{sbi_venn}
#' \title{Plot Venn diagram for logical Relations between two or three Sets}
#' \description{
#'   This function takes a contingency table and expands it two a data frame
#'   where every level combination is created according to the number of entries in the
#'   contingency table. You can reverse the process using the table command. The procedure is useful for
#'   instance for performing sample bootstrapping.
#' }
#' \usage{sbi_venn(x,y=NULL,z=NULL,vars=NULL,col=c("#cc888899","#8888cc99","#88cc8899"),cex=1.6,...)}
#' \arguments{
#'   \item{x}{data frame or matrix or vector, in the latter case y and for 3 sets as well z must be given}
#'   \item{y}{vector if x is vector, default: NULL}
#'   \item{z}{vector if x and y are vectors, default: NULL}
#'   \item{vars}{variable names to display if x, y and z are vectors, default: NULL}
#'   \item{col}{background colors for the circles, default: c("#cc888899","#8888cc99","#88cc8899")}
#'   \item{cex}{character expansion for the text characters, default: 1.6}
#'   \item{...}{argument delegated to the plot function}
#' }
#' \examples{
#' X=matrix(rnorm(2700),ncol=3)
#' colnames(X)=c("A","B","C")
#' X=X>0.4
#' Y=X[,1:2]
#' Y=Y>0.7
#' par(mfrow=c(2,2),mai=rep(0.1,4),pty='s')
#' sbi$venn(X)
#' sbi$venn(Y)
#' sbi$venn(x=LETTERS[1:9],y=LETTERS[3:6],z=LETTERS[4:12],vars=c('Xvar','Yvar','Zvar'))
#' sbi$venn(x=LETTERS[1:9],y=LETTERS[3:6],vars=c('Xvar','Yvar'))
#' }
#' \keyword{plot}
#' \seealso{\link[sbi:sbi-package]{sbi-package}}
#' FILE: sbi/R/venn.R

sbi$venn <- function (x,y=NULL,z=NULL,vars=NULL,col=c("#cc888899","#8888cc99","#88cc8899"),cex=1.6,...) {
    circle = function(x,y, radius=1,length=100) {
        theta = seq(0, 2 * pi, length = 100) 
        return(list(x=radius*cos(theta)+x,
                    y=radius*sin(theta)+y))
    }
    venn2D = function(x,col=c("#cc888899","#8888cc99"),cex=1.6,...) {
        if (!is.data.frame(x) & !is.matrix(x)) {
            stop("Error: Not a two column matrix or data frame!")
        }
        if (ncol(x) != 2) {
            stop("Error: Not a two column matrix or data frame!")   
        }
        # reset to useful values, slightly smaller than the defaults:
        # defaults: mai=c(1.02, 0.82, 0.82, 0.42)
        #opar=par(mai=c(1, 0.8, 0.8, 0.4),pty='s')
        # compute circle size
        circ.cex=60*par()$fin[1]/9
        
        plot(c(1,2),c(1,1),xlim=c(0.5,2.5),ylim=c(0.5,2.5),
             pch=19,cex=circ.cex,axes=FALSE,type="n",
             xlab="",ylab="",
             col=col,...)
        polygon(circle(1.2,1.5,radius=0.65),col=col[1],border=col[1])
        polygon(circle(1.8,1.5,radius=0.65),col=col[2],border=col[2])
        text(1.1,2.3,colnames(x)[1],cex=cex)
        text(1.9,2.3,colnames(x)[2],cex=cex)
        # the changes
        if (class(x[,1]) == "logical") {
            is=length(which(x[,1] & x[,2]))
            ls=length(which(x[,1] & !x[,2]))
            rs=length(which(!x[,1] & x[,2]))
            os=length(which(!x[,1] & !x[,2]))
        } else {
            xv=x[,1]
            xv=xv[xv!=""]
            yv=x[,2]
            yv=yv[yv!=""]
            is=length(intersect(xv,yv))
            ls=length(setdiff(xv,yv))
            rs=length(setdiff(yv,xv))
            os=""
        }   
        text(1.5,1.5,is,cex=cex)
        text(0.9,1.5,ls,cex=cex)
        text(2.1,1.5,rs,cex=cex)
        text(1.5,0.7,os,cex=cex)
        #par(opar)
    }                                                   
    if (class(y)[1] != "NULL" & class(z)[1]!="NULL") {
        M=matrix('',ncol=3,nrow=max(c(length(x),length(y),length(z))))
        M[1:length(x),1]=x
        M[1:length(y),2]=y
        M[1:length(z),3]=z        
        colnames(M)=c('x','y','z')
        if (class(vars[1])!="NULL") {
            colnames(M)=vars
        }
        sbi$venn(M,col=col,cex=cex,...)
    } else if (class(y)[1] != "NULL") {
        M=matrix('',ncol=2,nrow=max(c(length(x),length(y))))
        M[1:length(x),1]=x
        M[1:length(y),2]=y
        colnames(M)=c('x','y')
        if (class(vars[1])!="NULL") {
            colnames(M)=vars
        }
        sbi$venn(M,col=col,cex=cex,...)
    } else if (!is.data.frame(x) & !is.matrix(x)) {
        stop("Error: Not a matrix or data frame!")
    } else if (ncol(x) == 2) {
        venn2D(x,col=col[1:2],cex=cex,...)
    } else if (ncol(x) != 3) {
        stop("Error: Only two or three column matrix or data frame is accepted!")  
    } else if (!class(x[,1]) == "logical") {    
        rnames=unique(c(x[,1],x[,2],x[,3]))
        rnames=rnames[which(rnames!="")]
        M=matrix(FALSE,ncol=3,nrow=length(rnames))
        rownames(M)=rnames
        colnames(M)=colnames(x)
        for (i in 1:3) {
            idx=which(rnames%in%x[,i])
            M[idx,i]=TRUE
        }   
        sbi$venn(M,col=col,cex=cex,...)
    } else {  
        #opar=par(mai=c(0.5, 0.4, 0.4, 0.2),pty='s')
        circ.cex=70*par()$fin[1]/9
        plot(c(3.5,5.5,4.5),c(5.5,5.5,3.5),xlim=c(0,9),ylim=c(0,9),
             pch=19,cex=circ.cex,axes=FALSE,asp=1,
             xlab="",ylab="", col=col,type="n",...)
        polygon(circle(3.5,5.5,radius=2.3),col=col[1],border=col[1])
        polygon(circle(5.5,5.5,radius=2.3),col=col[2],border=col[2])
        polygon(circle(4.5,3.5,radius=2.3),col=col[3],border=col[3])
        
        text(0.5,7,colnames(x)[1],cex=cex)
        text(8.5,7,colnames(x)[2],cex=cex)
        text(4.5,0.25,colnames(x)[3],cex=cex)
        is=length(which(x[,1] & x[,2] & x[,3]))
        ls=length(which(x[,1] & !x[,2] & !x[,3]))
        rs=length(which(!x[,1] & x[,2] & !x[,3]))
        bs=length(which(!x[,1] & !x[,2] & x[,3]))        
        os=length(which(!x[,1] & !x[,2] & !x[,3]))
        xys=length(which(x[,1] & x[,2] & !x[,3]))
        xzs=length(which(x[,1] & !x[,2] & x[,3]))        
        yzs=length(which(!x[,1] & x[,2] & x[,3]))                
        text(4.5,4.8,is,cex=cex*0.8)
        if (os>0) {
            text(4.5,8.5,os,cex=cex*0.8)
        }
        text(2.2,6,ls,cex=cex*0.8)
        text(6.8,6,rs,cex=cex*0.8)
        text(4.5,2.1,bs,cex=cex*0.8)
        text(4.5,6.6,xys,cex=cex*0.8)    
        text(2.9,4,xzs,cex=cex*0.8)        
        text(6,4,yzs,cex=cex*0.8)            
        #par(opar)
    }   
}

sbi_venn <- sbi$venn

#' FILE: sbi/man/sbi_wilcoxR.Rd
#' \name{sbi$wilcoxR}
#' \alias{sbi$wilcoxR}
#' \alias{sbi_wilcoxR}
#' \title{Calculate the Effect size for a Wilcox test (Rosenthal 1991)}
#' \description{
#'   Calculate the effect size for a wilcox test due to Rosenthal (1991).
#'   Cohen's rule of thumb for interpretation is: approx 0.1 small, 0.3 medium and 0.5 and above is a large effect. 
#' }
#' \usage{sbi_wilcoxR(x,y=NULL,n=NULL)}
#' \arguments{
#'   \item{x}{either a wilcox test object or a vector with numerical values}
#'   \item{y}{if x is numerical vector either a vector with numerical values or a vector with cvategorical data having the same length as x}
#'   \item{n}{number of samples, required if x is a wilcox.test object}
#' }
#' \value{numerical value for effect size r having the same interpretation rules a Pearson's r}
#' \examples{
#' set.seed(123)
#' rn1=rnorm(100,mean=10,sd=1)
#' rn2=rnorm(80,mean=11,sd=1)
#' rn2=c(rn2,rnorm(20,mean=12,sd=2)) # bimodal distribution
#' mean(rn1)
#' mean(rn2)
#' sbi$wilcoxR(rn1,rn2) # two numerical vectors
#' cor(rn1,rn2)
#' wt=wilcox.test(rn1,rn2,exact=FALSE) 
#' sbi$wilcoxR(wt,n=200) # a test object
#' cat = as.factor(c(rep('A',100),rep('B',100)))
#' sbi$wilcoxR(x=c(rn1,rn2),y=cat) # num ~ cat
#' }
#' \keyword{effect-size}
#' \seealso{\link[sbi:sbi-package]{sbi-package}, \link[sbi:sbi_cohensD]{sbi$cohensD}.}
#' FILE: sbi/R/wilcoxR.R

sbi$wilcoxR <- function (x,y=NULL,n=NULL) {
    if (class(y)[1] %in% c("numeric","integer")) {
        wt=wilcox.test(x,y,exact=FALSE)
        n=length(x[which(!is.na(x))]) +  length(x[which(!is.na(x))])
        return(sbi$wilcoxR(wt,n=n))
    }  else if (class(y)[1] %in% c("factor")) {
        wt=wilcox.test(x~y,exact=FALSE)
        n=length(x[which(!is.na(x) & !is.na(y))])        
        return(sbi$wilcoxR(wt,n=n))
    } else {
        z = qnorm(x$p.value/2)
        return(abs(z/sqrt(n)))
    }
}

sbi_wilcoxR <- sbi$wilcoxR

#' FILE: sbi/man/sbi_ni.Rd
#' \name{sbi$ni}
#' \alias{sbi$ni}
#' \alias{sbi_ni}
#' \alias{\%ni\%}
#' \title{NOT-IN Operator}
#' \description{
#'   The `\%ni\%` operator is the inverse of the `\%in\%` operator.
#' }
#' \usage{lhs \%ni\% rhs}
#' \arguments{
#'   \item{lhs}{input vector to be matched}
#'   \item{rhs}{vector with matching values}
#' }
#' \value{vector of the same length as `lhs` with TRUE and FALSE values}
#' \examples{
#' data(mtcars)
#' v1=1:5
#' v2=3:7
#' v1 \%ni\% v2
#' v1 \%in\% v2
#' v2 \%ni\% v1
#' v2 \%in\% v1
#' }
#' \keyword{operator}
#' \seealso{\link[sbi:sbi-package]{sbi-package}, \link[sbi:sbi_pipe]{\%>\%}.}
#' FILE: sbi/R/ni.R

'%ni%' <- function (lhs, rhs) {
    return(!(lhs %in% rhs))
}

#' FILE: sbi/man/sbi_pipe.Rd
#' \name{sbi$pipe}
#' \alias{sbi$pipe}
#' \alias{sbi_pipe}
#' \alias{\%>\%}
#' \title{Forward Pipe Operator}
#' \description{
#'   Pipe a data structure using a R expression.
#'   Unlike the `magrittr` pipe, you must supply an actual function 
#'   instead of just a function name. For example
#'   `mtcars %>% head` will not work, but `mtcars %>% head()` will. 
#'   Furthermore note that since R 4.1 standard R has its own pipe operator, 
#'   the `|>` operator. The operator is part of Nathan Eastwoods poorman package
#'   \url{https://github.com/nathaneastwood/poorman} and taken from this package
#'   for illustrative purposes.
#' }
#' \usage{lhs \%>\% rhs}
#' \arguments{
#'   \item{lhs}{the input data, usually vector, matrix or data frame}
#'   \item{rhs}{the expression, condition used to filter the data}
#' }
#' \value{same data structure as `lhs` but filtered by `rhs` expression}
#' \examples{
#' data(mtcars)
#' mtcars %>% head()
#' mtcars %>% subset(select=c(mpg,cyl,disp,drat)) %>% head()
#' }
#' \author{Nathan Eastwood, Etienne Bacher}
#' \keyword{pipe}
#' \seealso{\link[sbi:sbi-package]{sbi-package}, \link[sbi:sbi_ni]{\%ni\%}.}
#' FILE: sbi/R/pipe.R

'%>%' <- function (lhs, rhs) {
  lhs <- substitute(lhs)
  rhs <- substitute(rhs)
  eval(as.call(c(rhs[[1L]], lhs, as.list(rhs[-1L]))), envir = parent.frame())
}

#' FILE: EOF

VIGNETTE = "---
title: %s tutorial
author: Detlef Groth, University of Potsdam, Germany
date: %s
output:
   html_document:
      toc: true
      theme: null
vignette: >
   %%\\VignetteEngine{knitr::rmarkdown}
   %%\\VignetteIndexEntry{%s tutorial}
include-before: |
    <style>
    body { max-width: 900px; font-family: Candara, sans-serif; padding: 1em; margin: auto;}
    pre  { font-family: Consolas; monospaced; }
    pre, blockquote pre, #TOC {
        font-size: 90%%;
        border-top:    0.1em #9ac solid;
        border-bottom: 0.1em #9ac solid;
        padding: 10px;
        background: #e9f9ff;
    }
    table { min-width: 400px; border-spacing: 5px;  border-collapse: collapse; }
    .title, .author, .date { text-align: center ; }
    #TOC > ul { margin-left: -20px;  list-style-type: square ; }
    a { color: #0655cc; text-decoration: none; }
    a:visited { color: #5506cc; }
    a:hover { color: #cc5506; }    
    table {    
        border-collapse: collapse;
        border-bottom: 2px solid;
        border-spacing: 5px;
        min-width: 400px;
    }
    table thead tr th { 
        background-color: #fde9d9;
        text-align: left; 
        padding: 10px;
        border-top: 2px solid;
        border-bottom: 2px solid;
    }
    table td { 
        background-color: #fff9e9;

        text-align: left; 
        padding: 10px;
    }
    </style>
    <center>some links on top</center>
---

## Introduction

"

USAGE = "
Usage:
=====
  %s [OPTIONS] [PKGNAME|SRCFILE|PKGDIR|RDFILE|PKGFILE]

  OPTIONS

    --help                 - show this help page%s
    --process      SRCFILE - create package structure from the given
                             R package source file
                             
    --build        PKGDIR  - build a package from the given package dir
    --check        PKGFILE - check the given package file (tar.gz file)
    --check-man    PKGDIR  - check the created Rd files from the package
    --doc          RDFILE  - view a package Rd file usually piped into less
    --vignettex    SRCFILE - extract the examples as pkg-examples.md
    --install      PKGFILE - install the given package file (tar.gz file)
    
  ARGUMENTS
  
    PKGNAME - the name of a new package, name should only consist of
              letters and numbers
    SRCFILE - a R package source file like sbi-src.R
    PKGDIR  - the directory containing the package files created
    RDFILE  - a documentation file in R-Docu format (Rdoc)
    PKGFILE - the package tar.gz file made from the --build argument
    
  AUTHOR
  
    Detlef Groth, Laura Schander, University of Potsdam  
    
  HELP     
  
    Use the issue tracker at Github https://github.com/mittelmark/rsfp/issues
  
  LICENSE and COPYRIGHT
  
    Copyright : 2024 - Detlef Groth, University of Potsdam  
    License   : See the file LICENSE
    
    
"
NP="
    --new-package  PKGNAME - create a new PKGNAME-src.R file
"

CheckRd <- function (pkg) {
    pwd=getwd()
    setwd(file.path(pkg,"man"))
    rd_files <- list.files(pattern = "\\.Rd$", full.names = TRUE)
    check_rd_file <- function(file) {
        result <- tools::checkRd(file)
        if (length(result) > 0) {
            return(data.frame(file = file, messages = paste(result, collapse = "; ")))
        }
        return(NULL)
    }
    check_results <- do.call(rbind, lapply(rd_files, check_rd_file))
    if (!is.null(check_results)) {
        print(check_results)
    } else {
        cat("No issues found in the Rd files.\n")
    }
    setwd(pwd)
}

ExtractEx <- function (srcfile) {
    fin  = file(srcfile, "r")
    fout = NULL
    ex = FALSE
    dr = FALSE
    lastindent = 0;
    usage=FALSE
    descr=FALSE
    while(length((line = readLines(fin,n=1)))>0) {
        if (descr) {
            line=gsub("\\\\code\\{(.+)\\}","`\\1`",line)
        }
        if (grepl("^#' Package:",line)) {
            pkg = gsub("#' Package: +","",line)
            rmdfile=paste(pkg,"-examples.Rmd",sep="")
            fout = file(rmdfile,'w')
            code=gsub("Introduction","EXAMPLES",gsub("tutorial","examples",VIGNETTE))
            cat(sprintf(code,pkg,Sys.Date(),pkg),file=fout)
        } else if (grepl("^#' \\\\name",line)) {
             cat(paste("### ",gsub(".+\\{(.+)\\}","\\1",line),"\n"),file=fout)
             name=gsub("[^A-Za-z0-9]","_",gsub(".+\\{(.+)\\}.*","\\1",line))
        } else if (grepl("^#' \\\\title",line)) {
            cat(paste("\n\n",gsub(".+\\{(.+)\\}","\\1",line),".\n",sep=""),file=fout)
            ex = FALSE
        } else if (grepl("^#' \\\\usage",line)) {
            if (grepl("^#' \\\\usage\\{.+\\}",line)) {
               cat(paste("\n\n__Usage:__\n\n```\n",gsub(".+\\{(.+)\\}","\\1",line),"\n```\n",sep=""),file=fout)
            } else if (grepl("^#' \\\\usage\\{.+",line)) {
               cat(paste("\n\n__Usage:__\n\n```{r eval=FALSE}\n",gsub(".+\\{(.+)","\\1",line),"\n",sep=""),file=fout)
               usage=TRUE    
            } else if (grepl("^#' \\\\usage\\{",line)) {
               cat(paste("\n\n__Usage:__\n\n```{r eval=FALSE}\n",sep=""),file=fout)
               usage=TRUE    
            }
        } else if (grepl("^#' \\\\description",line)) {
            if (grepl("^#' \\\\description\\{.+\\}",line)) {
               line=gsub("\\\\code\\{(.+)\\}","`\\1`",line)                                   
               cat(paste("\n\n",gsub(".+\\{(.+)\\}","\\1",line),"\n",sep=""),file=fout)
            } else if (grepl("^#' \\\\description\\{.+",line)) {
               cat(paste("\n\n",gsub(".+\\{(.+)","\\1",line),"\n",sep=""),file=fout)
               descr=TRUE    
            } else if (grepl("^#' \\\\description\\{",line)) {
               cat(paste("\n\n",sep=""),file=fout)
               descr=TRUE    
            }
        } else if ( (usage | descr)  & grepl("^#' .*\\}",line)) {
            if (usage) {                                 
                cat("```\n",file=fout)                     
                usage = FALSE
            } else {
                descr = FALSE
            }
        } else if (usage | descr) {
            cat(gsub("#' ","",line),"\n",file=fout)
        } else if (grepl("^#' \\\\examples",line)) {
            opt=""             
            if (grepl("%options:",line)) {
                opt=gsub(".+%options:","",line)
            }
            if (opt != "") {
                opt=paste(",",opt,sep="")
            }
            cat(sprintf("\n__Examples:__\n\n```{r label=%s%s}\n",name,opt),file=fout)
            ex = TRUE
        } else if (ex & lastindent < 3 & substr(line,1,4) == "#' }") {
            cat("```\n\n",file=fout)                   
            ex = FALSE
        } else if (ex & substr(line,1,11) == "#' \\dontrun") {
            dr = TRUE
        } else if (dr & substr(line,1,5) == "#'  }") {
            dr = FALSE
        } else if (ex) {
            lastindent = nchar(gsub("#'([ ]+).*","\\1",line))
            cat(gsub("\\\\%","%",gsub("#' ", "",line)),file=fout)  
            cat("\n",file=fout)         
        }
    }
    if (class(fout)[1] =="NULL") {
        close(fout)
    }
    close(fin)
    if (!dir.exists(file.path(pkg,"vignettes"))) {
        dir.create(file.path(pkg,"vignettes"))
    }
    file.copy(rmdfile,file.path(pkg,"vignettes",rmdfile),overwrite=TRUE)
    cat(sprintf("File: %s was written\n",file.path(pkg,"vignettes",rmdfile)))
}

Usage <- function (argv) {
  if (!grepl("rsfp-src.",argv[1])) {
    help=sprintf(USAGE,argv[1],"")
  } else {
    help=sprintf(USAGE,argv[1],NP)
  }
  cat(help)
}
Main <- function (argv) {
  VERSION=""
  PACKAGE=""
  if ("--help" %in% argv) {
    Usage(argv)
    
  } else if ("--new-package" %in% argv & length(argv) == 3) {
    if (!grepl("rsfp",argv[1])) {
      cat("Error: Only the file rspf-src.R can be used to create new packages!\n")
      return()
    }
    idx=which(argv=="--new-package") ;
    if (idx != 2) {
      Usage(argv)
    } else {
      new_pkgname = argv[3]
      if (!grepl("^[a-zA-Z][A-Za-z0-9]{2,}$",new_pkgname)) {
        cat("Error: The package name should only consist of numbers and letters!\n")
      } else {
        fin = file(argv[1],'r')
        outname = paste(new_pkgname,"-src.R",sep="")
        if (file.exists(outname)) {
          cat(sprintf("Error: File '%s' already exists, remove if you like to create a new package!\n",outname))
          return()
        }
        fout = file(outname,'w')
        main = FALSE
        while(length((line = readLines(fin,n=1)))>0) {
          if (grepl("^#' +FILE: +EOF",line)) {
            main = TRUE      
          } 
          if (main) {
            cat(sprintf("%s\n",line),file=fout)
          } else {
            cat(sprintf("%s\n",gsub("rsfp",new_pkgname,line)),file=fout)
          }
        }
        close(fin)
        close(fout)
      }
    }
    if (!file.exists(sprintf("%s-vignette.Rmd",new_pkgname))) {
      fout=file(sprintf("%s-vignette.Rmd",new_pkgname),'w')
      cat(sprintf(VIGNETTE,new_pkgname,Sys.Date(),new_pkgname),file=fout)
      close(fout)
    }
    cat("\nDone!\n\nYou can create a directory structure for your package file like this:\n\n")
    cat(gsub("rsfp",new_pkgname,sprintf("  Rscript %s --process %s\n",argv[1],argv[1])))
  } else if ("--process" %in% argv & length(argv) > 2) {
    idx=which(argv=="--process")
    rfile = argv[idx+1]
    if (!file.exists(rfile)) {
      cat(sprintf("Error: File '%s' does not exists!",rfile))
      return
    }
    fin = file(rfile,'r')
    fout = NULL
    while(length((line = readLines(fin,n=1)))>0) {
      if (grepl("^#' +FILE:",line)) {
        f = gsub("#' +FILE: +([^ ]+)","\\1",line)
        if (!is.null(fout)) {
          close(fout)
          fout = NULL
        }
        if (f == "EOF") {
          next
        }
        print(paste("creating", f))
        if (grepl(".+/",f)) {
          d = gsub("(.+)/.+","\\1",f) 
          if (!dir.exists(d)) {
            print(paste("creating",d))
            dir.create(d,recursive=TRUE,showWarnings=FALSE)
          }
          fout=file(f,'w') 
          next
        } else {
          fout=file(f,'w') 
        }
      } else if (!is.null(fout)) {
        if (grepl("^#' Package:",line)) {
          PACKAGE=gsub("^#' Package: +([^ ]+) ?.*","\\1",line)
        } else if (grepl("^#' Version:",line)) {
          VERSION=gsub("^#' Version: +([^ ]+) ?.*","\\1",line)
        }
        cat(gsub("^#' ?","",line),"\n",file=fout)
      }
    }
    close(fin)
    if (!is.null(fout)) {
      close(fout)
    }
    ## TODO extract 
    ## DESCRIPTION, NAMESPACE, LICENSE, NEWS
    ## extract tests/* files
    ## extract inst/files/* files
    vignette=sprintf("%s-vignette.Rmd",PACKAGE)
    vigdir  = sprintf("%s/vignettes",PACKAGE)
    if (file.exists(vignette)) {
      if (!dir.exists(vigdir)) {
        dir.create(vigdir)
      }
      file.copy(vignette,vigdir)
    }
    cat("\nDone!\n\nYou can create and install a package file like this:\n\n")
    cat(sprintf("  Rscript %s --build   %s\n",argv[1],PACKAGE))
    cat(sprintf("  Rscript %s --check   %s_%s.tar.gz\n",argv[1], PACKAGE, VERSION))
    cat(sprintf("  Rscript %s --install %s_%s.tar.gz\n\n", argv[1], PACKAGE, VERSION))
  } else if ("--build" %in% argv & length(argv) == 3) {
    library(tools)
    tools::Rcmd(c("build", argv[3]))
  } else if ("--check" %in% argv & length(argv) == 3) {
    library(tools)
    tools::Rcmd(c("check", argv[3]))
  } else if ("--install" %in% argv & length(argv) == 3) {
    library(tools)
    tools::Rcmd(c("INSTALL", argv[3]))
  } else if ("--check-man" %in%  argv) {
    CheckRd(argv[3])
  } else if ("--vignettex" %in% argv) {
    ExtractEx(argv[3])
  } else if ("--doc" %in% argv & length(argv) == 3) {
    if (!file.exists(argv[3])) {
      cat(sprintf("Error: File '%s' does not exists!\n",argv[3]))
    } else if (!grepl("Rd$",argv[3])) {
      cat(sprintf("Error: File '%s' is not an Rd file!\n",argv[3]))
    } else {
      cat(tools::Rd2txt(argv[3]))
    }
  } else {
    Usage(argv)
  }
}
if (sys.nframe() == 0L && !interactive()) {
  ## extract application's filename
  binname = gsub("--file=", "", grep("--file", commandArgs(), value=TRUE)[1])
  Main(c(binname,commandArgs(trailingOnly=TRUE)))
  
}
