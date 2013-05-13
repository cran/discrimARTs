\name{mix.mle}
\alias{mix.mle}
\title{
Find maximum likelihood estimate (MLE) of 5 parameters given input vector of observations, initial parameter values, and a method specifying distributions.
}
\description{
Algorithm computes maximum likelihood estimates of the parameters of either the normal mixtuture distribution or the facing gamma distribution model for a dimorphic trait.
}
\usage{
mix.mle(input, method = "normal", mix.prob = NULL, 
    dist1.par1 = NULL, dist1.par2 = NULL, 
    dist2.par1 = NULL, dist2.par2 = NULL, 
    lower = NULL, upper = NULL, distlist = NULL,
    optim.lower = rep(0, 5), optim.upper = c(1, rep(NA, 4)), ...)
}
\arguments{
  \item{input}{
      Vector of (numeric) trait observations.   Observations should be strictly positive.
  }
  \item{method}{
    Either \code{"normal"} or \code{"facing.gamma"}. 
    

Initial parameter estimation is implemented for  \code{"normal"}, but is only appropriate when \code{mix.prob} is close to 0.5. \cr User supplies initial parameter estimates for the facing gamma mixture distribution.
  }
  \item{mix.prob}{
    The initial probability of mixture distributions, specifying the proportion of the upper distribution. 
  }
  \item{dist1.par1}{
    First parameter of the lower distribution. This specifies the mean for \code{method="normal"}, and the shape for \code{method="facing.gamma"}.
  }
  \item{dist1.par2}{
    Second parameter of the lower distribution. This specifies the standard deviation for \code{method="normal"}, and the scale for \code{method="facing.gamma"}.
  }
  \item{dist2.par1}{
First parameter of the upper distribution, specifying parameters as in \code{dist1.par1}.
  }
  \item{dist2.par2}{
Second parameter of the upper distribution, specifying parameters as in \code{dist1.par2}.
  }
  \item{distlist}{
Optionally, the user can specify their own list containing a lower and upper distribution (PDF) function. \cr Each density function must take observations and 2 positional parameters, as per \code{dnorm}. \cr  Distributions taking >2 parameters may be used, but the remaining parameters must be encapsulated as fixed values within the functions.\cr
If distlist is specified, then \code{method} is set to \code{"user"}.
  }
  \item{lower}{
    For \code{method="facing.gamma"}, the lower bound may be set to minimum trait size minus 0.5\%, 1\%, or more of the range of trait sizes. \cr
    Otherwise ignored.
  }
  \item{upper}{
    For \code{method="facing.gamma"}; the upper bound may be set to maximum trait size plus 0.5\%, 1\%, or more of the range of trait sizes. \cr
    Otherwise ignored.
  }
  \item{optim.lower, optim.upper}{
    Numeric vector.  lower and upper bounds used by \code{optim}, \cr specifying:  
    \code{c(mix.prob, dist1.par1, dist1.par2, dist2.par1, dist2.par2)}. \cr 
By default, \code{mix.prob} is bounded between 0 and 1, and distribution parameters are bounded from below by 0. \cr
\code{optim} calls these by position;  thus order is significant and names are not needed.
  }
  \item{\dots}{
    Additional arguments are passed to optim.  In particular, \code{control=list(trace=5, REPORT=1)} displays information about the \cr optimization process.
  }
}
\details{
Computes maximum likelihood estimates of the parameters of either the normal mixture distribution or the facing gamma distribution model for a dimorphic trait.
}
\value{
    An object of class \code{discrimARTs}, which is a list containing the original input data and parameter values, as well as output from \code{optim}.
    \item{neglogLik}{Numeric.  Negative 2 \emph{x}  log likelihood of final optimized parameters.}
    \item{MLE.est}{Named vector containing the final optimized parameter values.}
}
\references{
Rowland JM, Qualls CR. 2005. Likelihood models for discriminating alternative phenotypes in morphologically dimorphic species. \cr Evolutionary Ecology Research 7: 421-434.
}
\note{
In general, \code{method="normal"} is converges well for a range of initial values.
\code{method="facing.gamma"} requires more care.

}

\seealso{
\code{\link{mix.loglik}},
\code{\link{optim}},
\code{\link{x_gideon}},
\code{\link{o_taurus}},
\code{\link{mix.synthetic}}
}
\examples{
data(x_gideon)

## Assuming normal, estimate initial conditions from data
fit.default.gideon <- mix.mle(x_gideon$horn)

## Estimation of mixture of normals, explicitly specifying method and parameters
fit.gideon <- mix.mle(x_gideon$horn, method='normal', 
    mix.prob=0.5, dist1.par1=100, dist1.par2=10, dist2.par1=300, dist2.par2=10)

## Default printing and plotting methods
print(fit.gideon)

## Compare results
layout(1:2)
plot(fit.gideon)
plot(fit.default.gideon)
}
