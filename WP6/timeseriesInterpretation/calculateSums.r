#  @author Dr Milto Miltiadou
#  @date 21st Dec 2021
#  @version 1.0
#  @brief Method that takes as input the peaks and a time series and calculates the durations and corresponding sum/integral of each sum
#  @brief how to run: calculateSums.r <inputPeaks.csv> <inputTimeSeries.csv> <output.csv> 
#  @brief example: Rscript "/home/milto/Documents/ASTARTE/Scripts/WP6/timeseriesInterpretation/calculateSums.r" "/home/milto/Documents/ASTARTE/Scripts/WP6/RNov21/RecaclulatePeaks/Sentinel-1201-202-301-302-401-402_DB_N_final_peaks.csv" "/home/milto/Documents/ASTARTE/Scripts/WP6/RNov21/RecaclulatePeaks/Sentinel-1-201-202-301-302-401-402-ave.csv" "/home/milto/Documents/ASTARTE/Scripts/WP6/RNov21/RecaclulatePeaks/Sentinel-1201-202-301-302-401-402_DB_N_final_peaks_withSums.csv" 


args = commandArgs(trailingOnly=TRUE)

if (length(args)!=3) {
  stop("Exactly 3 parameters should be given as input as follow:\n calculateSums.r <inputPeaks.csv> <inputTimeSeries.csv> <output.csv>", call.=FALSE)
} 


# Define numbers versus dates for conversion

dates<-c("Oct-14", "Nov-14", "Dec-14", "Jan-15", "Feb-15","Mar-15","Apr-15","May-15","Jun-15","Jul-15","Aug-15","Sep-15","Oct-15","Nov-15","Dec-15", "Jan-16", "Feb-16","Mar-16","Apr-16","May-16","Jun-16","Jul-16","Aug-16","Sep-16","Oct-16","Nov-16","Dec-16", "Jan-17", "Feb-17","Mar-17","Apr-17","May-17","Jun-17","Jul-17","Aug-17","Sep-17","Oct-17","Nov-17","Dec-17", "Jan-18", "Feb-18","Mar-18","Apr-18","May-18","Jun-18","Jul-18","Aug-18","Sep-18","Oct-18","Nov-18","Dec-18", "Jan-19", "Feb-19","Mar-19","Apr-19","May-19","Jun-19","Jul-19","Aug-19","Sep-19","Oct-19","Nov-19","Dec-19", "Jan-20", "Feb-20","Mar-20","Apr-20","May-20","Jun-20","Jul-20","Aug-20","Sep-20","Oct-20","Nov-20")


peaksFile=args[1]
timeseriesFile=args[2]
outFile=args[3]


peaks <- read.csv(file = peaksFile, row.names=1, head=TRUE,sep=",",check.names=FALSE)
timeseries <- as.numeric(read.csv(file = timeseriesFile, row.names=1, head=TRUE,sep=",",check.names=FALSE))
print (length(timeseries))
# calculate duration
durations=peaks$V4-peaks$V3
sums=c()
for (i in 1:length(durations))
{
   sum=0
   print(peaks$V3[i])
   for(j in peaks$V3[i]:peaks$V4[i])
   {
      sum=sum+timeseries[j]
   }
   sums=c(sums,sum)
}


V1 = peaks$V1
V2 = peaks$V2
V3 = peaks$V3
V4 = peaks$V4
V5 = durations
V6 = sums

V2str=c()
V3str=c()
V4str=c()

finalDF<-data.frame(V1,V2,V3,V4,V5,V6)
latexSymbol1=c()
latexSymbol2=c()
for(i in 1:length(V1))
{
   latexSymbol1=c(latexSymbol1,"&")
   latexSymbol2=c(latexSymbol2,"\\\\")   
   V2str=dates[V2]
   V3str=dates[V3]
   V4str=dates[V4]
}

finalDFLatex<-data.frame(latexSymbol1,V2str,latexSymbol1,round(V1,digits=3),latexSymbol1,V3str,latexSymbol1,V4str,latexSymbol1,V5,latexSymbol1,round(V6,digits=3),latexSymbol2) 


finalDF
print (latexSymbol1)
outFileLatex=paste(outFile,"Latex.csv", sep="")
write.csv(x=finalDF, file=outFile)
write.csv(x=finalDFLatex, file=outFileLatex)





