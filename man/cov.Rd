% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/medians.R
\name{cov}
\alias{cov}
\alias{cor}
\alias{var}
\title{Variance, Covariance, and Correlation for Complex Data}
\usage{
cov(
  x,
  y = NULL,
  na.rm = FALSE,
  method = "pearson",
  use = "everything",
  pseudo = FALSE,
  ...
)

cor(
  x,
  y = NULL,
  na.rm = FALSE,
  use = "everything",
  method = "pearson",
  pseudo = FALSE,
  ...
)

var(x, y = NULL, na.rm = FALSE, use = "everything", pseudo = FALSE, ...)
}
\arguments{
\item{x}{a numeric or complex vector, matrix, or dataframe.}

\item{y}{NULL (default) or a numeric vector, matrix, or dataframe with dimensions compatible with x.}

\item{na.rm}{logical. Should missing values be removed? Only considered when \code{x} is a vector.}

\item{method}{The method for calculating correlation coefficient. Only \code{"pearson"} is supported for complex variables, so this parameter is ignored.}

\item{use}{character string giving the desired method of computing covariances in the presence of missing values. Options are "everything" (default),
"all.obs", "complete.obs", or "na.or.complete". See \link[stats:cor]{stats::cov} for explanation of what each one does. Note that "pairwise.complete.obs" is not available for this complex method.}

\item{pseudo}{logical, if \code{TRUE} the pseudo variance, covariance, or correlation is calculated. i.e. no complex conjugation is performed.}

\item{...}{Other parameters, ignored.}
}
\value{
numeric or complex the sample variance, covariance, or correlation of the input data.
}
\description{
Wrappers of \link[stats:cor]{stats::var}, \link[stats:cor]{stats::cov}, and \link[stats:cor]{stats::cor} that are capable of handling complex input.
}
\details{
For vector input, the sample variance is calculated as,\cr
\eqn{sum(Conj( mean(x) - x ) * ( mean(x) - x )) / (length(x) - 1)}\cr
And the sample covariance is calculated as, \cr
\eqn{sum(Conj( mean(x) - x ) * ( mean(y) - y )) / (length(x) - 1)}\cr
The Pearson correlation coefficient, which is the only kind available for complex data,
is the covariance divided by the product of the standard deviations of all variables.
If \code{pseudo = TRUE}, these same expressions, sans \code{Conj()}, are used to calculate the pseudo, AKA relational,
versions of variance, covariance, or correlation.
}
\section{Functions}{
\itemize{
\item \code{cor()}: Correlation coefficient of complex variables.

\item \code{var()}: S3 Variance or Pseudo Variance of Complex Variables, a synonym for \link{cov}.

}}
\examples{
set.seed(4242)
n <- 9
foo <- complex(real = rnorm(n), imaginary = rnorm(n))
var(foo)
bar <- complex(real = rnorm(n), imaginary = rnorm(n))
var(x = foo, y = bar)
foobar <- data.frame(foo, bar)
cov(foobar)
cor(foobar)
}
