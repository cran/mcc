\name{getbetap.A.2}
\alias{getbetap.A.2}
\title{Momoent Corrected Correlation One}
\description{
Perform \eqn{MCC_1} by successively considering each of the \emph{n} samples as a potential outlier. Otherwise the syntax and output are the same as \code{\link{getbetap.A}}.}
\usage{
getbetap.A.2(x,y,z=NULL)
}
\arguments{
  \item{x}{ matrix (\emph{m} \eqn{\times} \emph{n}) of predictors. }
  \item{y}{ clinical/experimental \emph{n}-vector.}
  \item{z}{ covariate n-vector, assumed discrete with at least two observations per value of \emph{z}. If \emph{z} is not provided, the function assumes no covariates. Generates the first 4 moments of pearson correlation under permutation of \eqn{A}=\eqn{\sum_{k}^K} \eqn{\sum_i(x_{ik}}\eqn{ y_{\pi[i]k})}, given \emph{K} covariate classes defined by z. getAkmoment provides the results for the samples in stratum \emph{k}. }
}

\references{ Yi-Hui Zhou, Fred Wright, 2013, \emph{Fast And Robust Association Testing For High-Throughput Testing}, \emph{Submitted}.

    See also the vignette included with this package. }
\author{ Yi-Hui Zhou: \email{yihui_zhou@ncsu.edu} }

\seealso{\code{\link{getbetap.A}}.}
