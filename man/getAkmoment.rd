\name{getAkmoment}
\alias{getAkmoment}
\title{ Four moments of Pearson correlation under permutation}
\description{
The Pearson Correlation Coefficient can be derived by the correlation of scared feature matrix and clinical response. This function provides the first four moments under permutation of the scaled pearson correlation coefficient. In order to simplify the computation of moments summed over strata, an internal offset is applied to center each stratum levels.}
\usage{
getAkmoment(x,y)
}
\arguments{
  \item{x}{ matrix (\emph{m} x \emph{n})format. }
  \item{y}{ clinical/experimental \emph{n}-vector.}
}
\details{
 Generates the first 4 moments of pearson correlation under permutation of \eqn{A_k=\sum_{i\in I_k} x_i y_i}.  These steps are performed simultaneously for all m features.}
\references{ Yi-Hui Zhou, Fred Wright, 2013, \emph{Fast And Robust Association Testing For High-Throughput Testing}, \emph{Submitted}.

  See also the vignette included with this package. }
\author{ Yi-Hui Zhou: \email{yihui_zhou@ncsu.edu} }

\seealso{\code{\link{getAmoment}}.}
\examples{
set.seed(1)
## simulate a data matrix with 300 rows and 30 columns
m=300
n=30
## assume x is a gene expression matrix with 300 genes, 30 samples
x=matrix(rnorm(m*n),m,n)
## y is the clinical response (continuous)
y=rnorm(n)
out=getAkmoment(x,y)
names(out)
out$final2[1:10]   ## the second moments for the first 10 genes

## y can also be dichotomuous 
y=c(rep(1,15),rep(2,15))
out.dia=getAkmoment(x,y)
out.dia$final4[1:10]
}
\keyword{ Pearson correlation moments }