\name{o_taurus}
\alias{o_taurus}
\docType{data}
\title{
Horn measurements of the dung beetle Onthophagus taurus.
}
\description{
A measured sample of 275 males. Pronotum width (body) and cephalic horn length (horn) were measured in units of mm/100 \cr
from digital images using the procedures detailed below. This sample of horn lengths is used to illustrate fitting the mixture \cr 
of two facing gamma probability distributions. 
}
\usage{data(o_taurus)}
\format{
  A data frame with 275 observations on the following 2 variables.
  \describe{
    \item{\code{body}}{Pronotum width (mm/100)}
    \item{\code{horn}}{Cephalic horn length (mm/100)}
  }
}
\details{
\emph{Onthophagus taurus:} \cr
Collection data for the measured sample of the scarabaeid dung beetle Onthophagus
taurus: \cr
Cherry Research Farm; North Carolina Department of Agriculture; \cr
North Carolina
State University Goldsboro; Wayne Co., NC; UTM: 17S 769433E 3919364N; 3 June 2010; \cr
collected by Lena Guisewite & Wes Watson; dung-baited pitfall traps.

A measured sample of 275 males was selected from the above total sample of 1238.\cr Pronotum width was measured in ocular micrometer units with an M5Wild stereo microscope outfitted with a ocular lens graticule and converted to mm/100. \cr
Cephalic horn length was measured as its curvilinear
function in standardized units and converted to mm/100 from digital images using the procedures and \cr
landmarks indicated in Tomkins, J.L. et al. 2006. Major differences in minor allometries: A reply
to Moczek. The American Naturalist 167:612-618. \cr
After conversion to metric scale, all measures
were transformed by addition of a small amount of "jitter" to reduce artifacts in bin-sorting due to data \cr 
stratification caused by the measurement conversion factors.
All measures were rounded to the nearest mm/100.

To fit a mixture of facing gamma distributions to the horn length distribution, we set a lower bound equal to the minimum horn length minus 1.5\% of \cr 
the range of horn lengths (LB= 2-7= -5) and an upper bound equal to maximum horn length plus 0.5\% of the range (UB = 482+3= 485).  Here and  \cr
occasionally in other samples, there is a technical problem when the minimum trait size is zero or close to zero; the lower gamma probability\cr 
density function for the minimum horn length x cannot
be evaluated at a negative value of LB+x = -5+ 2=-3. A simple solution is to shift \cr the horn length distribution up by at least +3, fit the shifted horn length distribution with the mixture of facing gammas, and then translate \cr 
the fitted mixture probability density function back to the original scale. Here we shift the horn length sample data up by +8; set LB=-5+8=3 and \cr UB=485+8=493; 
and estimate \eqn{\theta_1}= 45.6, \eqn{\alpha_1}= 1.48, \eqn{\theta_2}= 62.8, \eqn{\alpha_2}= 1.84, and mixture probability=0.62 . To translate the fit
back to the original scale, \cr 
one can plot the fitted mixture probability density function versus the orginal data vector.


}
\source{
%%  ~~ reference to a publication or URL from which the data were obtained ~~
Data published for the first time here in.
}
\references{
%%  ~~ possibly secondary sources and usages ~~
Rowland JM, Qualls CR. 2005. Likelihood models for discriminating alternative phenotypes in morphologically dimorphic species.\cr 
Evolutionary Ecology Research 7: 421-434.
}
\seealso{
\code{\link{mix.mle}},
\code{\link{x_gideon}}
}
\examples{
data(o_taurus)
## Scatter plot of horn versus body showing trait scaling
plot(o_taurus$horn, o_taurus$body)

## Plot histogram with observations 
hist(o_taurus$horn, freq=FALSE)
## To include points on x-axis of histogram
points( o_taurus$horn, rep(0, nrow(o_taurus)))

## use the o_taurus dataset to estimate facing gamma
## Using an offset to shift data away from zero
horn.offset <- 8
taurus.fit <- mix.mle(input=o_taurus$horn+horn.offset, method='facing.gamma', 
    mix.prob=0.59, lower=2 + horn.offset - 7, upper=482 + horn.offset + 3, 
    dist1.par1=1.37, dist1.par2=52.7, dist2.par1=2.29, dist2.par2=43.8)
## Default printing function shows a subset of the available information
print(taurus.fit)
## Default plotting function shows histogram, raw observations, and the computed distributions,
## along with a legend including estimated values
plot(taurus.fit)
## To exclude legend
plot(taurus.fit, legend=FALSE)
}
\keyword{datasets}
