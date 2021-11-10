
# Clear all pre-defined variables
rm(list=ls()) 


require(graphics)

# Read the .csv file
VH <- read.csv(file="./Sentinel-1VH201-202-301-302-401-402-1.csv",row.names=1, head=TRUE,sep=",",check.names=FALSE)
VV <- read.csv(file="./Sentinel-1VV201-202-301-302-401-402-1.csv",row.names=1, head=TRUE,sep=",",check.names=FALSE)

# Convert to DB
VH <- 10*log10(abs(VH))
VV <- 10*log10(abs(VV))

# extracts two lists with the labels of the axes
rowNames = row.names(VH)
colNames = colnames(VH)

peaksVH = findpeaks(VH)
widthdVH = peaksVH[,4]-peaksVH[,3]

peaksVV = findpeaks(VV)
widthdVV = peaksVV[,4]-peaksVV[,3]

