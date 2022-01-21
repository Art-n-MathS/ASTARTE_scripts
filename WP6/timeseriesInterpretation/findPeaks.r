#  @author Dr Milto Miltiadou
#  @date 13th Dec 2021
#  @version 1.0
#  @brief This Script finds the peaks of a given input phenological graph and exports them into a .csv file with X columns X1- X2- X3- 
#  @brief how to run: findPeaks.r <input.csv> <output.csv> 
#  @brief example: Rscript "/home/milto/Documents/ASTARTE/Scripts/WP6/timeseriesInterpretation/findPeaks.r" "/home/milto/Documents/ASTARTE/Scripts/WP6/RNov21/RecaclulatePeaks/Sentinel-1VH201-202-301-302-401-402_DB_N_151.csv" "/home/milto/Documents/ASTARTE/Scripts/WP6/RNov21/RecaclulatePeaks/Sentinel-1VH201-202-301-302-401-402_DB_N_151_peaks.csv"


require(graphics)
require(pracma)


args = commandArgs(trailingOnly=TRUE)

if (length(args)!=2) {
  stop("Exactly 2 parameters should be given as input as follow:\nfindPeaks.r <input.csv> <graph.png> <title> <xAxisTitle> <yAxisTitle> ", call.=FALSE)
} 

inFile=args[1]

outFile=args[2]


inCSV <- read.csv(file = inFile, row.names=1, head=TRUE,sep=",",check.names=FALSE)

data = as.numeric(inCSV[1,])

peaks = findpeaks(data)



write.csv(x=peaks, file=outFile)
