#  @author Dr Milto Miltiadou
#  @date 15th Nov 2022
#  @version 2.0
#  @brief script that takes as input a multiline .csv file and exports and a line graph
#  @brief how to run: SmoothLineLeaks.r <Inoriginal.csv> <outNormalisedDir> <Insmoothed.csv> <testingPeriod e.g. 1:50> <peaksOriginal.csv> <peaksSmoothed.csv> <out.png> <title> <xAxisTitle> <yAxisTitle> <width> <height>
#  @brief example: Rscript "/home/milto/Documents/ASTARTE/Scripts/WP6/RNov21/SmoothLinePeaks.r" "/home/milto/Documents/ASTARTE/Scripts/WP6/RNov21/Sentinel-1_filteredAll/Sentinel-1VH201-202-301-302-401-402-1_DB.csv"  "/home/milto/Documents/ASTARTE/Scripts/WP6/RNov21/smoothedSentinel1/" "/home/milto/Documents/ASTARTE/Scripts/WP6/RNov21/Sentinel-1_filteredAll/Sentinel-1VH201-202-301-302-401-402-1_filtered121_DB.csv" 1:49 "/home/milto/Documents/ASTARTE/Scripts/WP6/RNov21/peaks/peaksVH.csv" "/home/milto/Documents/ASTARTE/Scripts/WP6/RNov21/peaks/peaksVH121.csv" "/home/milto/Documents/ASTARTE/Scripts/WP6/RNov21/pngs/Sentinel-1VH201-202-301-302-401-402-1_filtered121_DB.png" "Filtering SAR signal - Peak and Width echo detection" "Months" "Average Backscattered Coefficient (DB)" 1500 750

library(stringr)

args = commandArgs(trailingOnly=TRUE)

if (length(args)!=12) {
  stop("Exactly 12 parameters should be given as input as follow:\nSmoothLineLeaks.r <original.csv> <outNormalisedDir>  <smoothed.csv> <testingPeriod e.g. 1:50> <peaksOriginal.csv> <peaksSmoothed.csv> <out.png> <title> <xAxisTitle> <yAxisTitle> <width> <height> ", call.=FALSE)
} 

### User defined Variables ###
# The name of the imported .csv file

originalCSV = args[1]

outNormalisedCSV = paste(args[2],substr(args[1], nchar(args[1])-44,nchar(args[1])),"_normalised.csv",sep="")
# str_replace_all(outNormalisedCSV, fixed(" "),"")


smoothedCSV = args[3]

# testing period
tp = args[4]

peaksOriginalCSV = args[5]

peaksSmoothedCSV = args[6] 

# The name of the image where the graph will be stored
outPng = args[7]

# The title that appears on the top of the graph
mainTitle  = args[8]
# The tile of the x-axis
xAxisTitle = args[9]
# The title of the y-axis
yAxisTitle = args[10]

w = as.integer(args[11])
h = as.integer(args[12])

originalDF       <- read.csv(file=originalCSV,row.names=1, head=TRUE,sep=",",check.names=FALSE)
smoothedDF      <- read.csv(file=smoothedCSV,row.names=1, head=TRUE,sep=",",check.names=FALSE)
peaksOriginalDF <- read.csv(file=peaksOriginalCSV,row.names=1, head=TRUE,sep=",",check.names=FALSE)
peaksSmoothedDF <- read.csv(file=peaksSmoothedCSV,row.names=1, head=TRUE,sep=",",check.names=FALSE)

tpRange=as.numeric(sapply(strsplit(tp, ":"),"[[",1)):as.numeric(sapply(strsplit(tp, ":"),"[[",2))
x= as.numeric(sapply(strsplit(tp, ":"),"[[",2))
# originalArray
originalLST=list()
for(i in 1:ncol(originalDF)){
  originalLST[i]<-originalDF[,i]
}
originalArray=array(unlist(originalLST))
meanOriginal = mean(originalArray[tpRange])
stdOriginal  = sd  (originalArray[tpRange])
originalNormalisedArray = (originalArray - meanOriginal) / (4*stdOriginal) + (1/2)
originalNormalisedArray[originalNormalisedArray<0.0]<-0.0
originalArray
originalNormalisedArray


# smoothedArray
smoothedLst=list()
for(i in 1:ncol(smoothedDF)){
  smoothedLst[i]<-smoothedDF[,i]
}
smoothedArray=array(unlist(smoothedLst))
meanSmoothed = mean(smoothedArray[tpRange])
stdSmoothed  = sd  (smoothedArray[tpRange])
smoothedNormalisedArray = (smoothedArray - meanSmoothed) / (4*stdSmoothed) + (1/2)
smoothedNormalisedArray[smoothedNormalisedArray<0.0]<-0.0
write.csv(smoothedNormalisedArray,file=outNormalisedCSV)

print ("*****")
# peaksOriginalArray, startsOriginalArray, endsOriginalArray, widthsOriginalArray, amplitudeOriginalLst
peaksOriginalLst=list()
startsOriginalLst=list()
endsOriginalLst=list()
widthsOriginalLst=list()
amplitudesOriginalNonNormalised=list()
for(i in 1:nrow(peaksOriginalDF)){
  amplitudesOriginalNonNormalised[i]<-peaksOriginalDF[i,1]
  peaksOriginalLst [i]<-peaksOriginalDF[i,2]
  startsOriginalLst[i]<-peaksOriginalDF[i,3]
  endsOriginalLst  [i]<-peaksOriginalDF[i,4]
  widthsOriginalLst[i]<-peaksOriginalDF[i,4]-peaksOriginalDF[i,3]
}
amplitudesOriginalNonNormalisedArray =array(unlist(amplitudesOriginalNonNormalised))
amplitudesOriginalNormalisedArray = (amplitudesOriginalNonNormalisedArray - meanOriginal) / (4*stdOriginal) + (1/2)
peaksOriginalArray =array(unlist(peaksOriginalLst ))
startsOriginalArray=array(unlist(startsOriginalLst))
endsOriginalArray  =array(unlist(endsOriginalLst  ))
widthsOriginalArray=array(unlist(widthsOriginalLst))
amplitudesOriginalNonNormalisedArray
amplitudesOriginalNormalisedArray
peaksOriginalArray
startsOriginalArray
endsOriginalArray
widthsOriginalArray

print ("*****")

#peaksSmoothedArray, startsSmoothedArray, endsSmoothedArray, widthsSmoothedArray
peaksSmoothedLst=list()
startsSmoothedLst=list()
endsSmoothedLst=list()
widthsSmoothedLst=list()
amplitudesSmoothedNonNormalised=list()
for(i in 1:nrow(peaksSmoothedDF)){
  amplitudesSmoothedNonNormalised[i]<-peaksSmoothedDF[i,1]
  peaksSmoothedLst [i]<-peaksSmoothedDF[i,2]
  startsSmoothedLst[i]<-peaksSmoothedDF[i,3]
  endsSmoothedLst  [i]<-peaksSmoothedDF[i,4]
  widthsSmoothedLst[i]<-peaksSmoothedDF[i,4]-peaksSmoothedDF[i,3]
}
amplitudesSmoothedNonNormalisedArray =array(unlist(amplitudesSmoothedNonNormalised))
amplitudesSmoothedNormalisedArray = (amplitudesSmoothedNonNormalisedArray - meanSmoothed) / (4*stdSmoothed) + (1/2)
peaksSmoothedArray =array(unlist(peaksSmoothedLst ))
startsSmoothedArray=array(unlist(startsSmoothedLst))
endsSmoothedArray  =array(unlist(endsSmoothedLst  ))
widthsSmoothedArray=array(unlist(widthsSmoothedLst))
amplitudesSmoothedNonNormalisedArray
amplitudesSmoothedNormalisedArray
peaksSmoothedArray
startsSmoothedArray
endsSmoothedArray
widthsSmoothedArray
print ("*****")
#tpRange

# originalLst[tpRange]
# smoothedLst[tpRange]
#peaksOriginalLst


# define name and size of image to be exported
png(filename=outPng, width = w, height = h)

# plot backscattered coefficient as points - used to start the plot, points drawn again later
plot(peaksOriginalArray, amplitudesOriginalNormalisedArray,xlab=xAxisTitle, ylab=yAxisTitle, lwd=2,cex.lab=3,cex.axis=2.5, xlim=c(0,x), ylim=c(0,1.1),col="darkgreen")

# draw vertical lines for Januaries
abline(v=2,col="gray",lwd = 1.6)
abline(v=14,col="gray",lwd = 1.6)
abline(v=26,col="gray",lwd = 1.6)
abline(v=38,col="gray",lwd = 1.6)
abline(v=50,col="gray",lwd = 1.6)
# abline(v=62,col="gray",lwd = 1.6)
# abline(v=74,col="gray",lwd = 1.6)

# draw vertical dotted lines for Julies
abline(v= 8,col="gray",lwd = 0.6)
abline(v=20,col="gray",lwd = 0.6)
abline(v=32,col="gray",lwd = 0.6)
abline(v=44,col="gray",lwd = 0.6)
# abline(v=56,col="gray",lwd = 0.6)
# abline(v=68,col="gray",lwd = 0.6)

lines(tpRange, originalNormalisedArray[tpRange],col="blue",lwd = 4.5)
points(peaksOriginalArray, amplitudesOriginalNormalisedArray,col="green",lwd = 4.5)


lines(tpRange, smoothedNormalisedArray[tpRange],col="orange",lwd = 4.5)
points(peaksSmoothedArray, amplitudesSmoothedNormalisedArray,col="red",lwd = 4.5)



# draw legend table
#op <- par(cex = 2.7) # font size
#legend(x = "bottomright",  legend = c("Backscattered Coefficient (VV)  ", "Backscattered Coefficient (VH) ",  "Backscattered Coefficient (VV)", "Backscattered Coefficient (VH)", "November", "May"), lty = c(0, 0, 1, 1,  1, 1), pch = c(1, 1, NA, NA,  NA, NA),  col = c("black","darkgreen", "blue", "green",  "gray","gray"), lwd = c(2,2,2,2,1.6,0.6))     


dev.off()





