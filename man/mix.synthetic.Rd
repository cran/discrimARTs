\name{mix.synthetic}
\alias{mix.synthetic}
\alias{mix.synthetic.normal}
\alias{mix.synthetic.facing.gamma}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Generate synthetic mixtures for testing of \code{mix.mle}.
}
\description{
These functions can be helpful in assessing the convergence of \code{mix.mle}.
}
\usage{
mix.synthetic.normal(N = 200, mix.prob = 0.5,  mu1, sd1, mu2, sd2)
mix.synthetic.facing.gamma(N = 200, mix.prob = 0.5, lower, upper, shape1, scale1, shape2, scale2)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{N}{
    Number of draws
}
  \item{mix.prob}{
    Probability of drawing from upper distribution.
}
  \item{lower, upper}{
    Bounds for facing gamma.
}
  \item{shape1, scale1, shape2, scale2}{
    Distribution parameters for facing.gammas.  Lower = 1, upper = 2. 
}
  \item{mu1, sd1, mu2, sd2}{
    Distribution parameters for normals.  Lower = 1, upper = 2. 
}
}
\value{
Numeric vector of random deviates from the mixture of distributions.
}

\seealso{
  \code{\link{mix.loglik}}
}
\examples{
## Normal: Draw samples
normalmix.draws <- mix.synthetic.normal(mix.prob=0.1, mu1=10, sd1=2, mu2=20, sd2=2)
## Estimated initial conditions may fail for mix.prob far from 0.5
normalmix.fit <- mix.mle(normalmix.draws)
plot(normalmix.fit)

## Facing gamma: draw samples
gammamix.params <- list(lower = 0.37, upper=4.72, mix.prob=0.55, dist1.par1=1.50, dist1.par2=.4, dist2.par1=3.2, dist2.par2=.5)
    ## simulate synthetic data
gammamix.draws <- with(gammamix.params, 
    mix.synthetic.facing.gamma( lower=lower, upper=upper,  mix.prob=mix.prob,
            shape1=dist1.par1, scale1=dist1.par2, 
            shape2=dist2.par1, scale2=dist2.par2, 
        ) 
)
## fit and return
## Use parameters as initial values 
gammamix.fit <- with(gammamix.params,
        mix.mle(gammamix.draws,  method='facing.gamma', 
            lower=lower, upper=upper, mix.prob=mix.prob, 
            dist1.par1=dist1.par1, dist1.par2=dist1.par2, 
            dist2.par1=dist2.par1, dist2.par2=dist2.par2
        )
)
plot(gammamix.fit)

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
