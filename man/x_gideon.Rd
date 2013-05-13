\name{x_gideon}
\alias{x_gideon}
\docType{data}
\title{
Horn measurements of the rhinoceros beetle \emph{Xylotrupes} gideon.
}
\description{
%%  ~~ A concise (1-5 lines) description of the dataset. ~~
A measured sample of 177 males. Pronotum width (body) and pronotal horn length (horn) were measured in mm/10 with a slide micrometer. \cr This sample of horn lengths is used to illustrate fitting the mixture of two normal probability distributions. 
}
\usage{data(x_gideon)}
\format{
  A data frame with 177 observations on the following 2 variables.
  \describe{
    \item{\code{body}}{Pronotum width (mm/10)}
    \item{\code{horn}}{Pronotal horn length (mm/10)}
  }
}
\details{
\emph{Xylotrupes} gideon: \cr
Collection data for the measured sample of the dynastine rhinoceros beetle  Xylotrupes gideon: \cr
Lampung Province, Sumatra, Indonesia; 1999; \cr
collected by Agusyanto Hasan.

A measured sample of 177 males was selected from the above total sample of 193. Pronotum width was measured at its greatest width. \cr Pronotal horn length was measured from the mid-dorsal point of the posterior margin of the pronotum to the anterior apex of the left line of the pronotal horn.

}
\source{
%%  ~~ reference to a publication or URL from which the data were obtained ~~
Rowland, J.M. 2003. Male horn dimorphism, phylogeny and systematics of rhinoceros beetles of the
genus \cr \emph{Xylotrupes} (Scarabaeidae: Coleoptera). Aust. J. Zool., 51: 213-258.
}
\references{
%%  ~~ possibly secondary sources and usages ~~
Rowland JM, Qualls CR. 2005. Likelihood models for discriminating alternative phenotypes in morphologically dimorphic species. \cr Evolutionary Ecology Research 7: 421-434.
}
\seealso{
\code{\link{mix.mle}},
\code{\link{o_taurus}}
}

\examples{
data(x_gideon)
## Scatter plot of horn versus body showing trait scaling
plot(x_gideon$horn, x_gideon$body)

## Plot histogram with overlaid density plot
hist(x_gideon$horn, freq=FALSE)
points( x_gideon$horn, rep(0, nrow(x_gideon)))

## Estimation of mixture of normals
fit.gideon <- mix.mle(x_gideon$horn, method='normal', 
    mix.prob=0.5, dist1.par1=100, dist1.par2=10, dist2.par1=300, dist2.par2=10)

print(fit.gideon)
plot(fit.gideon)
}

\keyword{datasets}
