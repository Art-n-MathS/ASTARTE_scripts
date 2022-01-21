#  @author Dr Milto Miltiadou
#  @date 21st Dec 2021
#  @version 1.0
#  @brief This script takes as input 3 files exported by findPeaks.r (usually VV, VH and avererge of the two) and merges them into 1. If two or more times one peak is included within the files then is preserved in the final output, otherwise discarded
#  @brief how to run: mergePeaks.r <input1.csv> <input2.csv> <input3.csv> <output.csv> 
#  @brief example: Rscript "/home/milto/Documents/ASTARTE/Scripts/WP6/timeseriesInterpretation/mergePeaks.r" "/home/milto/Documents/ASTARTE/Scripts/WP6/RNov21/RecaclulatePeaks/Sentinel-1-201-202-301-302-401-402-ave_DB_N_peaks.csv" "/home/milto/Documents/ASTARTE/Scripts/WP6/RNov21/RecaclulatePeaks/Sentinel-1VH201-202-301-302-401-402_DB_N_peaks.csv" "/home/milto/Documents/ASTARTE/Scripts/WP6/RNov21/RecaclulatePeaks/Sentinel-1VV201-202-301-302-401-402_DB_N_peaks.csv" "/home/milto/Documents/ASTARTE/Scripts/WP6/RNov21/RecaclulatePeaks/Sentinel-1201-202-301-302-401-402_DB_N_final_peaks.csv" 


args = commandArgs(trailingOnly=TRUE)

if (length(args)!=4) {
  stop("Exactly 4 parameters should be given as input as follow:\n mergePeaks.r <input1.csv> <input2.csv> <input3.csv> <output.csv> ", call.=FALSE)
} 

inFile1=args[1]
inFile2=args[2]
inFile3=args[3]
outFile=args[4]


inCSV1 <- read.csv(file = inFile1, row.names=1, head=TRUE,sep=",",check.names=FALSE)
inCSV2 <- read.csv(file = inFile2, row.names=1, head=TRUE,sep=",",check.names=FALSE)
inCSV3 <- read.csv(file = inFile3, row.names=1, head=TRUE,sep=",",check.names=FALSE)

allpeaksRaw<-rbind(inCSV1  ,inCSV2)
allpeaksRaw<-rbind(allpeaksRaw,inCSV3)
allpeaksRawS=allpeaksRaw[order(allpeaksRaw$V2),]
print(allpeaksRawS)

# allpeaksRaw
finalpeaks=c()
i=1

# merging peaks, start and end dates - if a peak appears at least twice within the three input files then it is kept within the finealpeaks
finalamplitudes=c()
finalstarts=c()
finalends=c()
finaldurations=c()
while (i <= length(allpeaksRawS$V2)) 
{
   count=1
   i=i+1  

   while(i<=length(allpeaksRawS$V2) && allpeaksRawS$V2[i]==allpeaksRawS$V2[i-1] )
   {
      count=count+1
      i=i+1  
   }
   if(count>=2)
   {
      finalpeaks=c(finalpeaks,allpeaksRawS$V2[i-1])
      if (count == 2)
      {
         newValue=(allpeaksRawS$V1[i-1]+allpeaksRawS$V1[i-2])/2
         finalamplitudes=c(finalamplitudes,newValue)
         startV=median(c(allpeaksRawS$V3[i-1],allpeaksRawS$V3[i-2]))
         finalstarts=c(finalstarts,startV)
         endV=median(c(allpeaksRawS$V4[i-1],allpeaksRawS$V4[i-2]))
         finalends=c(finalends,endV)
         durationV=endV-startV
         finaldurations=c(finaldurations,durationV)
      }
      else if (count == 3)
      {
         newValue=(allpeaksRawS$V1[i-1]+allpeaksRawS$V1[i-2]+allpeaksRawS$V1[i-3])/3
         finalamplitudes=c(finalamplitudes,newValue)
         startV=median(c(allpeaksRawS$V3[i-1],allpeaksRawS$V3[i-2],allpeaksRawS$V3[i-3]))
         finalstarts=c(finalstarts,startV)
         endV=median(c(allpeaksRawS$V4[i-1],allpeaksRawS$V4[i-2],allpeaksRawS$V3[i-3]))
         finalends=c(finalends,endV)
         durationV=endV-startV
         finaldurations=c(finaldurations,durationV)
      }
      else
      {
         #  THIS IS NOT AN OPTION, final peaks appear either twice or three times within the three files
      }
   }
   
}

V1 = finalamplitudes
V2 = finalpeaks
V3 = finalstarts
V4 = finalends 

finalDF<-data.frame(V1,V2,V3,V4)
latexSymbol1=c()
latexSymbol2=c()
for(i in 1:length(finalpeaks))
{
   latexSymbol1=c(latexSymbol1,"&")
   latexSymbol2=c(latexSymbol2,"\\\\")   
}

finalDFLatex<-data.frame(finalpeaks,latexSymbol1,round(finalamplitudes,digits=4),latexSymbol1,finalstarts,latexSymbol1,finalends,latexSymbol1,finaldurations,latexSymbol2) 
allpeaksRaw$V2
finalpeaks
finalDF
print (latexSymbol1)
outFileLatex=paste(outFile,"Latex.csv", sep="")
write.csv(x=finalDF, file=outFile)
write.csv(x=finalDFLatex, file=outFileLatex)





