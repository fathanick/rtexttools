\name{classify_models}
\alias{classify_models}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
makes predictions from a train_models() object.
}
\description{
Uses a trained model from the \code{\link{train_models}} function to classify new data.
}
\usage{
classify_models(corpus, models, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{corpus}{
Class of type \code{\link{matrix_container-class}} generated by the \code{\link{create_corpus}} function.
}
  \item{models}{
List of models to be used for classification generated by \code{\link{train_models}}.
}
  \item{\dots}{
Other parameters to be passed on to \code{\link{classify_model}}.
}
}
\details{
Use the list returned by \code{\link{train_models}} to use multiple models for classification.
}
\author{
Wouter Van Atteveldt <wouter@vanatteveldt.com>, Timothy P. Jurka <tpjurka@ucdavis.edu>
}
\examples{
library(RTextTools)
data <- read_data(system.file("data/NYTimes.csv.gz",package="RTextTools"),type="csv")
data <- data[sample(1:3100,size=100,replace=FALSE),]
matrix <- create_matrix(cbind(data$Title,data$Subject), language="english", 
removeNumbers=TRUE, stemWords=FALSE, weighting=weightTfIdf)
corpus <- create_corpus(matrix,data$Topic.Code,trainSize=1:75, testSize=76:100, 
virgin=FALSE)
models <- train_models(corpus, algorithms=c("MAXENT","SVM"))
results <- classify_models(corpus, models)
}
\keyword{method}
