\name{discrimARTs}
\alias{Discriminate ARTs}
\alias{discrimARTs}
\docType{package}
\title{
Discriminate Alternative Reproductive Tactics (ARTs) of Morphological Dimorphisms Using Likelihood Mixture Models
}
\description{
Algorithm discriminates with explicit confidence the alternative reproductive tactics (ARTs) in dimorphic
mating systems with bimodal trait size distributions such as in the male horn polyphenisms in beetles. The bimodal distribution is parameterized by normal mixture distributions or facing gamma mixture distribution models. Likelihood of the alternative tactics for a given trait size is computed from the mixture models. Algorithm computes MLE of distribution parameters and the morph ratio.

}
\details{
%\tabular{ll}{
%Package: \tab discrimARTs\cr
%Type: \tab Package\cr
%Version: \tab 1.0\cr
%Date: \tab 2013-03-29\cr
%License: \tab What license is it under?\cr
%}
In Rowland & Qualls (2005) and in diverse unpublished data we have found that in the male-dimorphic ornaments of beetles which express gamma distributions the trait of the smaller, usually subordinate male is almost always skewed right and that the trait size distribution of the larger, usually dominant male is almost always skewed left. Unfortunately, previously available gamma mixture models are designed to fit data in which the long tails (skewness) of both gamma distributions extend to the right toward larger values. Therefore, this package is specifically and uniquely designed to fit the mixture of facing gamma distributions, where the trait distribution of the smaller male is skewed right; and the trait size distribution of the larger male is skewed left. 

The package user supplies a vector of sample measurements that represent a dimorphic trait; initial parameter values for each of two probability density functions (pdf); and the mixture probability (morph ratio) of the morph with the larger trait sizes. For the normal pdfs each distribution has mean and standard deviation parameters. For the facing gamma pdfs each distribution has shape and scaling parameters: The left gamma distribution is Y1 = LB + theta1*X1; and the right gamma distribution is Y2 = UB - theta2*X2. In the latter expression LB and UB are the lower and upper bounds of trait sizes; X1 ~ Gamma(alpha1,1); X2 ~ Gamma(alpha2,1); alpha is the shape parameter and theta is the scaling parameter. The mean trait size of the first gamma pdf is LB + alpha1*theta1 and the mean of the facing gamma pdf is UB - alpha2*theta2. LB may be chosen equal to the smallest trait size in the sample minus a small amount often computed such as 1/2\% or 1\% or more of the range of sample trait sizes; UB is chosen as the largest trait size in the sample plus a small amount.

The sample column vector and the initial parameter values must represent a mixture of two distrubutions
with adequately separated means, usually by at least two standard deviations. Random sampling of a dimorphic trait and reasonable choices of initial values are also assumptions of this model.

}
\author{
Rowland JM, Qualls CR, Gunning C.
}

\references{
Cite the following paper:

Rowland JM, Qualls CR. Likelihood models for discriminating alternative phenotypes in morphologically dimorphic species. 
Evolutionary Ecology Research 7: 421-434 (2005).
}
%\cite{
%Rowland JM, Qualls CR. Likelihood models for discriminating alternative phenotypes in morphologically dimorphic species. 
%Evolutionary Ecology Research 7: 421-434 (2005)
%
%}
\seealso{
\code{\link{mix.mle}},
\code{\link{mix.loglik}},
\code{\link{x_gideon}},
\code{\link{o_taurus}},
\code{\link{mix.synthetic}}
}
