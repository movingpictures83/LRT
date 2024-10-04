  library(DEGseq)


dyn.load(paste("RPluMA", .Platform$dynlib.ext, sep=""))
source("RPluMA.R")

input <- function(inputfile) {
  parameters <<- read.table(inputfile, as.is=T);
  rownames(parameters) <<- parameters[,1];
    pfix = prefix()
  if (length(pfix) != 0) {
     pfix <<- paste(pfix, "/", sep="")
  }
}

run <- function() {}

output <- function(outputfile) {
  kidneyR1L1 <- paste(pfix, parameters["group1", 2], sep="/")
  liverR1L2 <- paste(pfix, parameters["group2", 2], sep="/")
  refFlat <- paste(pfix, parameters["reference", 2], sep="/")
  mapResultBatch1 <- c(kidneyR1L1)  ## only use the data from kidneyR1L1 and liverR1L2
  mapResultBatch2 <- c(liverR1L2)
  outputDir <- outputfile
  DEGseq(mapResultBatch1, mapResultBatch2, fileFormat="bed", refFlat=refFlat,
         outputDir=outputDir, method="LRT")




  #geneExpFile <- system.file("extdata", "GeneExpExample5000.txt", package="DEGseq")
  #geneExpMatrix1 <- readGeneExp(file=geneExpFile, geneCol=1, valCol=c(7,9,12,15,18))
  #geneExpMatrix2 <- readGeneExp(file=geneExpFile, geneCol=1, valCol=c(8,10,11,13,16))
  #layout(matrix(c(1,2,3,4,5,6), 3, 2, byrow=TRUE))
  #par(mar=c(2, 2, 2, 2))
  #DEGexp(geneExpMatrix1=geneExpMatrix1, geneCol1=1, expCol1=c(2,3,4,5,6), groupLabel1="kidney",
  #     geneExpMatrix2=geneExpMatrix2, geneCol2=1, expCol2=c(2,3,4,5,6), groupLabel2="liver",
  #     method="MARS")
}
