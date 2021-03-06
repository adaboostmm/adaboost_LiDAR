% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/lasSlotPrint.R
\name{lasSlotPrint}
\alias{lasSlotPrint}
\title{Prints S4 slots data and header from LiDAR files of type(.las or .laz or .LAS or .LAZ)}
\usage{
lasSlotPrint(lasObject)
}
\arguments{
\item{lasObject}{A las object of class:LAS (LASF) to be analyzed}
}
\value{
Prints slots details from a las object
}
\description{
This function reads a las object of class:LAS(LASF), prints the available S4 slots.
It prints a few important variables from S4 slot data and S4 slot header. It also
displays the coordinate Reference system(CRS) for the data file.
}
\examples{
#=======================================================================#
# Prints slots from LiDAR file
#=======================================================================#
dFile <- system.file("extdata", "lasc04765150.las", package = "adaboost")
lasOut <- readFile(dFile)
lasSlotPrint(lasOut)

}
