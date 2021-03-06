\name{TrendUncertainty}
\alias{TrendUncertainty}
\title{Compute uncertainties in trend statistics according to different start and end dates}
\description{The function computes \code{trend} statistics (linear \code{trend} slope and intercept, Mann-Kendall tau and p-value) with associated uncertainties (standard deviation) by sampling the time series according to different start and end dates using the function \code{\link{TrendSample}}}
\usage{TrendUncertainty(Yt, 
    seg = NULL, bp = NoBP(), 
    sample.method = c("sample", 
        "all", "none"), 
    sample.min.length = 0.75, 
    sample.size = 30, 
    fun.unc = NULL, trend = TrendAAT)}
\arguments{
  \item{Yt}{univariate time series of class \code{\link{ts}}}
  \item{seg}{a vector indicating segments of a time series. If NULL, provide \code{bp}}
  \item{bp}{detected breakpoints in the time series as returned by \code{\link[strucchange]{breakpoints}}}
  \item{sample.method}{Sampling method for combinations of start and end dates to compute uncertainties in trends. If "sample" (default), \code{trend} statistics are computed for a sample of combinations of start and end dates according to \code{sample.size}. If "all", \code{trend} statistics are computed for all combinations of start and end dates longer than \code{sample.min.length}.  If "none", \code{trend} statistics will be only computed for the entire time series (i.e. no sampling of different start and end dates). }
  \item{sample.min.length}{Minimum length of the time series (as a fraction of total length) that should be used to compute \code{trend} statistics. Time windows between start and end that are shorter than min.length will be not used for \code{trend} computation.}
  \item{sample.size}{sample size (number of combinations of start and end dates) to be used if \code{method} is sample.}
  \item{fun.unc}{function to summarize the uncertainty of the \code{trend} (default: quantile 0.025 and 0.975). Can be also 'sd' or other functions.}
  \item{trend}{method that should be used to compute the \code{trend}}
}

\value{The function returns a data.frame with the estimated Mann-Kendall tau, p-value and slope and intercept of a linear \code{trend} with uncertainties defined as the standard deviation of these estimates dependent on different start and end dates.}

\author{Matthias Forkel <matthias.forkel@tu-dresden.de> [aut, cre]}



\seealso{\code{\link{Trend}}}
\examples{

# aggregate time series to annual time steps
ndvi <- aggregate(ndvi, FUN=mean, na.rm=TRUE)
plot(ndvi)

# compute trend statistics dependent on start and end of the time series
trd.ens <- TrendSample(ndvi)
plot(trd.ens)

# compute statistics for trend
TrendUncertainty(ndvi)

# compute trend statistics with uncertainties by considering breakpoints
bp <- breakpoints(ndvi ~ time(ndvi))
trd.unc <- TrendUncertainty(ndvi, bp=bp)
trd.unc
trd.unc[[1]]$slope_unc


}
