% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/corrgrapher.R
\name{corrgrapher}
\alias{corrgrapher}
\alias{corrgrapher.explainer}
\alias{corrgrapher.matrix}
\alias{corrgrapher.default}
\title{Create a \code{corrgrapher} object}
\usage{
corrgrapher(x, ...)

\method{corrgrapher}{explainer}(
  x,
  cutoff = 0.2,
  values = NULL,
  cor_functions = list(),
  ...,
  feature_importance = NULL,
  partial_dependence = NULL
)

\method{corrgrapher}{matrix}(x, cutoff = 0.2, values = NULL, cor_functions = list(), ...)

\method{corrgrapher}{default}(x, cutoff = 0.2, values = NULL, cor_functions = list(), ...)
}
\arguments{
\item{x}{an object to be used to select the method, which must satisfy conditions:
\itemize{
\item{if \code{data.frame} (default), columns of \code{numeric} type must contain numerical variables and columns of \code{factor} class must contain categorical variables. Columns of other types will be ignored.}
\item{if \code{explainer}, methods \code{\link[ingredients]{feature_importance}} and \code{\link[ingredients]{partial_dependence}} must not return an error. 
See also arguments \code{feature_importance} and \code{partial_dependence}.}
\item{if \code{matrix}, it will be converted with \code{\link{as.data.frame}}.}
}}

\item{...}{other arguments.}

\item{cutoff}{a number. Correlations below this are treated as \strong{no} correlation. Edges corresponding to them will \strong{not} be included in the graph.}

\item{values}{a \code{data.frame} with information about size of the nodes, containing columns \code{value} and \code{label} (consistent with colnames of \code{x}). Default set to equal for all nodes, or (for \code{explainer}) importance of variables.}

\item{cor_functions}{a named \code{list} of functions to pass to \code{\link{calculate_cors}}. Must contain necessary functions from \code{num_num_f}, \code{num_cat_f} or \code{cat_cat_f}. Must contain also \code{max_cor}}

\item{feature_importance}{Either: \itemize{
\item{an object of \code{feature importance_explainer} class, created by \code{\link[ingredients]{feature_importance}} function, or}
\item{a named \code{list} of parameters to pass to \code{\link[ingredients]{feature_importance}} function.}
}}

\item{partial_dependence}{a named \code{list} with 2 elements: \code{numerical} and \code{categorical}. Both of them should be either: \itemize{
\item{an object of \code{aggregated_profile_explainer} class, created by \code{\link[ingredients]{partial_dependence}} function, or}
\item{a named \code{list} of parameters to pass to \code{\link[ingredients]{partial_dependence}}}. 
}
If only one kind of data was used, use a list with 1 object.}
}
\value{
A \code{corrgrapher} object. Essentially a \code{list}, consisting of following fields:
\itemize{
\item{\code{nodes} - a \code{data.frame} to pass as argument \code{nodes} to \code{\link{visNetwork}} function}
\item{\code{edges} - a \code{data.frame} to pass as argument \code{edges} to \code{\link{visNetwork}} function}
\item{\code{pds} (if x was of \code{explainer} class) - a \code{list} with 2 elements: \code{numerical} and \code{categorical}. Each of them contains an object of \code{aggregated_profiles_explainer} used to create partial dependency plots.}
\item{\code{data} - data used to create the object.}
}
}
\description{
This is the main function of \code{corrgrapher} package. It does necessary calculations and creates a \code{corrgrapher} object. 
Feel free to pass it into \code{plot}, include it in knitr report or generate a simple HTML.
}
\details{
Data analysis (and creating ML models) involves many stages. For early exploration, 
it is useful to have a grip not only on individual series (AKA variables) available, 
but also on relations between them. Unfortunately, 
the task of understanding correlations between variables proves to be difficult. 
corrgrapher package aims to plot correlations between variables in form of a graph. 
Each node on it is associated with single variable. Variables correlated with each other 
(positively and negatively alike) shall be close, and weakly correlated  - far from each other.
}
\examples{
# convert the category variable
df <- as.data.frame(datasets::Seatbelts)
df$law <- factor(df$law) 
cgr <- corrgrapher(df)
}
\seealso{
\code{\link{plot.corrgrapher}}, \code{\link{knit_print.corrgrapher}}, \code{\link{save_to_html}}
}
