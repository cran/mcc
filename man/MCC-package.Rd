\name{MCC-package}
\alias{MCC-package}
\alias{MCC}
\docType{package}
\title{
Moment Correction Correlation
}
\description{
MCC is a method which can measure association between rows of a matrix with a single response vector. The method uses a parametric approximation to permutation of the correlation coefficient. It is very accurate, often to p-values of \eqn{10^{-8}} or smaller.}
\details{
\tabular{ll}{
Package: \tab MCC\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2014-04-27\cr
License: \tab GPL (>= 2)\cr
}
Please prepare a matrix format of the data, with each row representing the feature and each column for each sample. Please also prepare the clinical response/phenotype in a vector format.
}
\author{
Yi-Hui Zhou

Maintainer: Yi-Hui Zhou <yihui_zhou@ncsu.edu>

}
\references{
Yi-Hui Zhou, Fred Wright, 2013, \emph{Fast And Robust Association Testing For High-Throughput Testing}, \emph{Submitted}.
}

\keyword{mcc}

