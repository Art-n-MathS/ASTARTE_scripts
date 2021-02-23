



### User defined Variables ###
# The title that appears on the top of the graph
mainTitle  = "Average Seasonal Backscattered Coefficient Values Between May 1992 and October 1994 using ERS-1 data"
# The tile of the x-axis
xAxisTitle = "Months"
# The title of the y-axis
yAxisTitle = "Average Backscattered Coefficient (DB)"
# The name of the imported .csv file
fileName = "/home/milto/Documents/ASTARTE/ASTARTE_sample_data/level5/ERS-1/ERS-1_allHeight.csv"
# The name of the image where the graph will be stored
exportFileName = "/home/milto/Documents/ASTARTE/ASTARTE_sample_data/level5/ERS-1/ERS-1.png"



# Read the .csv file
data <- read.csv(file=fileName,row.names=1, head=TRUE,sep=",",check.names=FALSE)

# extracts two lists with the labels of the axes
rowNames = row.names(data)
colNames = colnames(data)

png(filename=exportFileName, width = 900, height = 400)

# plot graph with the given titles
matplot(t(data), type="l", lty=1, lwd=2, main= mainTitle, xlab=xAxisTitle, ylab=yAxisTitle)


# modify numbering\labels of the axes to agree with the inserted table of the .csv file
axis(1, at=1:length(colNames), lab=colNames)

# Add legend to the table
legend("topleft", inset=0.01, legend=rowNames, col=c(1:6), bg= ("white"), horiz=F, lty=1)

dev.off()


