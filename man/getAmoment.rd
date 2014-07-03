\name{getAmoment}
\alias{getAmoment}
\title{ Four moments of Pearson correlation under permutation given covariates}
\description{
The Pearson Correlation Coefficient can be derived by the correlation of scared feature matrix and clinical response. This function provides the first four moments under permutation of the scaled pearson correlation coefficient. Different from function \code{\link{getAkmoment}}, this function can handle covariate. For convenience in later functions, both central and noncentral moments are outputted.}
\usage{
getAmoment(x,y,z=NULL)
}
\arguments{
  \item{x}{ matrix (\emph{m} \eqn{\times} \emph{n}) of predictors. }
  \item{y}{ clinical/experimental \emph{n}-vector.}
  \item{z}{ covariate n-vector, assumed discrete with at least two observations per value of \emph{z}. If \emph{z} is not provided, the function assumes no covariates. Generates the first 4 moments of pearson correlation under permutation of \eqn{A}=\eqn{\sum_{k}^K} \eqn{\sum_i(x_{ik}}\eqn{ y_{\pi[i]k})}, given \emph{K} covariate classes defined by z. getAkmoment provides the results for the samples in stratum \emph{k}. }
}
\details{
 Genertate the first moments of pearson correlation under permutation if we are given the covariate \emph{z}. In practice, we first divide into K strata,  \code{\link{getAkmoment}} actually provides the results for the samples in stratum k. \code{\link{getAmoment}} uses covariate z to know which sample belong to the kth stratum, and obtains the 4 moments for each of the K strata (using getAkmoment), and finally computes the 4 moments for \eqn{A=\sum_k(A_k)}. The actual x and y objects are mxn matrices, so \code{\link{getAkmoment}} computes the results simultaneously for all m features.
}
\references{ Yi-Hui Zhou, Fred Wright, 2013, \emph{Fast And Robust Association Testing For High-Throughput Testing}, Submitted.

  See also the vignette included with this package. }
\author{ Yi-Hui Zhou: \email{yihui_zhou@ncsu.edu} }

\seealso{\code{\link{getAkmoment}}.}
\examples{
set.seed(1)
######################################################################
## simulate a data matrix with 300 rows and 30 columns              ##
## assume x is a gene expression matrix with 300 genes, 30 samples  ##
## y is the clinical response (continuous)                          ##
######################################################################
m=300
n=30
x=matrix(rnorm(m*n),m,n)
y=rnorm(n)
out=getAmoment(x,y)
names(out)
out$EA2[1:10]   ## the second moments of A=sum(x*(centered phenotype)) 
		            ## under permutation for the the first 10 genes

## y can also be dichotomuous 
y=c(rep(1,15),rep(2,15))
out.dia=getAmoment(x,y)
length(out.dia$EA4)

## z is covariate. It can either be continuous or dichotomous 
## if z is dichotomous
z=c(rep(1,25),rep(2,5))
out.cov=getAmoment(x,y,z)
out.cov$EA2

## if z is continuous, then we need to splict z into K strata
## for example, suppose I sign K=4 strata for z
K=4
z=rexp(n)
cutpoint=as.vector(quantile(z, seq(0,1,b=1/K)))
newz=rep(0,n)
for (k in (1:K)){
	if (k<K) which.group=which((z>=cutpoint[k] & z<cutpoint[k+1])==TRUE)
	if (k==K) which.group=which((z>=cutpoint[k] & z<=cutpoint[k+1])==TRUE)
	newz[which.group]=k
}
out.cov.con=getAmoment(x,y,newz)
out.cov.con$EA3[1:5]

}
