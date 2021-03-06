% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/UTL.ifar.extre.marker.r
\name{ifar.extre.marker}
\alias{ifar.extre.marker}
\title{Find out extre values}
\usage{
ifar.extre.marker(dataset, variable)
}
\arguments{
\item{variable}{Name of the variable.It should be entered as a character. For
example, "BMI".}

\item{dataset}{Name of the dataset}
}
\value{
This function will return a new dataset with a new column which is named as
"variable.marker" and marks out the 5 highest and 5 lowest values.
}
\description{
This function will find out the 5 highest and 5 lowest values and put an
"X" after their ID.
}
\examples{
ifar.extre.marker(baseline, "BMI")
}

