\name{plot.PhenopixMY}
\alias{plot.PhenopixMY}
\title{Plot multi-year phenopix objects}
\description{Plotting methods for objects of class \code{\link{PhenopixMY}}}
\usage{\method{plot}{PhenopixMY}(x, add = FALSE, 
    col.fit = "black", 
    type = "ts", ...)}
\arguments{
  \item{x}{an object of class \code{\link{PhenopixMY}}}
  \item{add}{\code{add} to existing plot?}
  \item{col.fit}{color for fitting line}
  \item{type}{plot \code{type}: 'ts' plots the original data, the fitted curve and the metrics; 'metrics' plots only time series of the metrics}
  \item{\dots}{further arguments as in \code{\link{plot.default}}}
}


\references{Filippa, G., Cremonese, E., Migliavacca, M., Galvagno, M., Forkel, M., Wingate, L., Tomelleri, E., Morra di Cella, U. and Richardson, A. D.: Phenopix: A R package for image-based vegetation phenology, Agricultural and Forest Meteorology, 220, 141-150, doi:10.1016/j.agrformet.2016.01.006, 2016.}
\author{Matthias Forkel <matthias.forkel@tu-dresden.de> [aut, cre]}



\seealso{\code{\link{plot.phenopix}}, \code{\link{PhenopixMY}}}
\examples{
ppixmy <- PhenopixMY(ndvi, "spline", "trs")
plot(ppixmy)

plot(ppixmy, type="metrics")

}
