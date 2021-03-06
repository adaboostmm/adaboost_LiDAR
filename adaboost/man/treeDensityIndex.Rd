% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/treeDensityIndex.R
\name{treeDensityIndex}
\alias{treeDensityIndex}
\title{Algorithm for tree density core and Forest Classification}
\usage{
treeDensityIndex(lasObject)
}
\arguments{
\item{lasObject}{A las object of class:LAS (LASF) to be analyzed}
}
\value{
A list with 6 components: Area of XY coordinates, Tree coordinates,
    Total no of trees, Tree density score, Tree classification score,
    Rumple Index.
}
\description{
This function calculates a list of the following important attributes related
to trees in a LAS file:
Area of XY coordinates, Tree coordinates(X, Y, height), Total no of trees,
Tree density score, Tree classification score and Rumple Index.
All of these attributes can be fed into a machine learning
algorithm to predict whether the file represents any of these categories:
(very dense forest of tall trees, dense forest of tall trees, tall sparse trees,
very dense bush, small sparse trees).
}
\details{
This function reads a LAS object and extracts the tree coordinates from Canopy
Height Model(CHM). It caclulates Rumple Index using an existing algorithm.
Rumple Index is the ratio of canopy surface over ground surface; for a perfectly
flat surface, rumple_index = 1 and for rough surface, rumple_index > 1.

It assigns a tree density score for a LAS file based on this algorithm:
Each tree is a vector with 3 components:
(X value, Y value and Height which is Z value).
This function prepares a tree tibble for all the trees vectors.
Calculates a tree distance matrix using L2 norm; sorts the columns.
Keep only those trees which are within 15 meter radius, calculate the column mean.
Output the tree density score for the LAS file as a mean of all column means of
the neighboring trees that are within 15 meters of distance.

This function assigns a tree classification score for a LAS file using this method:
It calculate a quantile rank of the tree heights and tree classification score is
percentage of tall trees with quantile rank == 4 with respect to tree height.

It extracts values of minimum and maximum of X coordinates for LAS file,
calculate rangeX. It extracts values of minimum and maximum of Y coordinates,
calculate rangeY. Then it calculates the area of the recangle XY as rangeX*rangeY.
}
\examples{
#=======================================================================#
# Extracts tree attributes
#=======================================================================#
dFile <- system.file("extdata", "project.las", package = "adaboost")
lasOut <- readFile(dFile)
scoreOutput <- treeDensityIndex(lasOut)
RumpleIndex <- scoreOutput["RumpleIndex"]
treedensityScore <- scoreOutput["densityScore"]
treeclassificationScore <- scoreOutput["treeFreq"]
treeCount <- scoreOutput["treeCount"]
areaXY <- scoreOutput["areaXY"]
paste("RumpleIndex =", RumpleIndex)
paste("Total No of Trees =", treeCount)
paste("Tree Density Score =", treedensityScore)
paste("Tree Classification Score =", treeclassificationScore)
paste("Area of XY in square meter =", areaXY)

}
