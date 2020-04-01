% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/corrgrapher.R
\name{corrgrapher}
\alias{corrgrapher}
\alias{corrgrapher.explainer}
\alias{corrgrapher.default}
\title{Create a CorrGrapheR object}
\usage{
corrgrapher(x, ...)

\method{corrgrapher}{explainer}(
  x,
  cutoff = 0.2,
  feature_importance = NULL,
  partial_dependency = NULL,
  method = c("pearson", "kendall", "spearman")
)

\method{corrgrapher}{default}(
  x,
  cutoff = 0.2,
  method = c("pearson", "kendall", "spearman"),
  values = NULL,
  ...
)
}
\arguments{
\item{x}{a \code{data.frame}, in which for all \code{numeric} columns calling \code{\link{cor}} makes sense.}

\item{...}{other parameters.}

\item{cutoff}{a number. Corelations below this are treated as \strong{no} corelation. Edges corresponding to them will \strong{not} be included in the graph.}

\item{feature_importance}{(Optional) an object of \code{feature importance_explainer} class, created by \code{\link{ingredients::feature_importance}} function. If not supported, calculated inside function.}

\item{method}{passed directly to \code{\link{cor}} function.}

\item{values}{(Optional) a \code{data.frame} with information abour size of the nodes, containing columns \code{value} and \code{label} (consistent with colnames of \code{x}). Deafult set to equal for all nodes, or (for \code{explainer}) importance of variables.}
}
\value{
A \code{corrgrapher} object.
}
\description{
Create a CorrGrapheR object before passing it to \code{plot()}.
}
\examples{
df <- as.data.frame(datasets::Seatbelts)[,1:7] # drop the binary target variable
cgr <- corrgrapher(df)
}
\seealso{
\code{\link{plot.corrgrapher}}
}