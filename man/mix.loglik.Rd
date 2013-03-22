\name{mix.loglik}
\alias{mix.loglik}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Compute the log likelihood of input data given a parameter vector and a list of 2 distribution functions.
}
\description{
This is the main function to compute the likelihood... ??

This function is not intended to be called directly by users, but can be useful to test user-specified distributions passed to \code{mix.mle}.
}
\usage{
mix.loglik(.pars, .input, .distlist, do.sum = TRUE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{.pars}{
    A list of 5 the following 5 parameters:
        \itemize{
          \item{mix.prob} Probability of second distribution.
          \item{dist1.par1} Lower distribution: mean for normal, shape for gamma
          \item{dist1.par2} Lower distribution: SD for normal, scale for gamma
          \item{dist2.par1} Upper distribution: mean for normal, shape for gamma
          \item{dist2.par2} Upper distribution: SD for normal, scale for gamma
        }
}
  \item{.input}{
      Vector of (numeric) trait observations.
}
  \item{.distlist}{
        List of 2 distribution density functions. The first is the lower or leftmost distribution; the second is the upper or rightmost.
}
  \item{do.sum}{
        By default, return sum of likelihoods.  Set to \code{FALSE} for testing.
}
}
\details{
??
}
\value{
Numeric: the negative log likelihod of ??
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
??
%% ~put references to the literature/web site here ~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
  \code{\link{mix.mle}}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
