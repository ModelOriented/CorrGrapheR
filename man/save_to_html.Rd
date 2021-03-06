% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/save_to_html.R
\name{save_to_html}
\alias{save_to_html}
\title{Generate and save HTML report}
\usage{
save_to_html(cgr, file = "report.html", overwrite = FALSE, ...)
}
\arguments{
\item{cgr}{An object of \code{corrgrapher} class. See \code{\link{corrgrapher}} function.}

\item{file}{File to write content to; passed directly to \code{\link[htmltools]{save_html}}.}

\item{overwrite}{If \code{file} exists, should it be overwritten?}

\item{...}{Other parameters}
}
\value{
A file of \code{file} name will be generated with 2 elements: graph of correlations in the middle and a plot on the right. 
If \code{x} was created from \code{explainer}, the plot will visualize partial dependency
of the currently selected variable.
In other case, the plot will visualize distribution of the variable.
}
\description{
Create an interactive document in HTML based on \code{corrgrapher} object.
}
