
# c-band data for entire study area filtered
Af<-c(-11.6496397270891,-11.388527341566,-11.1626211611812,-10.7709142055273,-10.4702081190412,-10.297278510782,-10.1690081784866,-10.3108921815994,-10.4585927612367,-10.6469050375461,-10.8954263888282,-11.3433629573715,-11.5629486389943,-12.176806242299,-11.3875939551695,-11.412660912257,-11.0148345117958,-10.5920282009116,-10.4080223909864,-10.5102313930756,-10.7545750593137,-10.836326037146,-10.9514240458166,-10.79074830457,-11.0437794299733,-11.3831906257456,-11.3219999328164,-11.1914712459036,-10.8716920150463,-10.5824866516703,-10.3750507977272,-10.5146818625503,-10.648118778215,-10.8260973882162,-10.8561668190584,-10.7594025741754,-10.6735535503422,-10.9371578153411,-10.8932755194734,-10.947252223265,-10.7979006293638,-10.7266496443522,-10.5355030905843,-10.4944902880017,-10.6386455498984,-10.7151306131783,-10.8695360729576,-10.6593247178208,-10.7993114715929,-10.8706502058605,-11.1163068930441,-11.0823111917478,-10.8966812119788,-10.7488579748798,-10.652236954551,-10.7105578510892,-10.8731284291486,-10.9211600178523,-10.8993200377925,-10.8163121268858,-10.7993240917353,-10.9158597742678,-10.9352007042387,-11.0525225277176,-10.821631630293,-10.6506113015956,-10.4648729854706,-10.499520744261,-10.5770915287971,-10.7755613840533,-10.9273970876162,-11.0440249800324) 
# c-band data for entire study area filtered
A<-c(-11.8839818665544,-11.3558385707335,-11.254312161456,-10.7165536473514,-10.3968146627144,-10.2935563631455,-9.98707726975831,-10.3216664382143,-10.4783742578554,-10.5762481315342,-10.8499611784531,-11.3270343505167,-11.3604103732633,-13.1611581503915,-10.7665752480822,-11.5737204120313,-11.2215084754322,-10.3722828774767,-10.1903814618587,-10.4731408594664,-10.8416239713654,-10.8476378161834,-11.173218070413,-10.4472606056287,-10.9463593123311,-11.7186234393964,-11.34221112523,-11.262145391818,-10.9028354676566,-10.5160659747652,-10.1446575162199,-10.5363126118815,-10.6250718344569,-10.9027820031965,-11.0041475854632,-10.7017251876931,-10.4150300996847,-11.1613423904543,-10.8621792642395,-11.0216955258252,-10.7651247159998,-10.820903173295,-10.4366825938873,-10.3690665468568,-10.6608773673843,-10.703461079042,-11.1167445487895,-10.436490504683,-10.7931850479193,-10.7696333132921,-11.3036351868597,-11.1998716163323,-10.8416766882024,-10.728247539564,-10.5502409158795,-10.6331036366773,-10.9610189186494,-10.9773051843848,-10.9403690798834,-10.7542094741763,-10.7255777384373,-10.9612898565456,-10.8670549288722,-11.2831033431448,-10.8057147398128,-10.6248210798265,-10.3423873498234,-10.4791016177709,-10.5105915916996,-10.7888602616332,-10.9832376867362,-11.1068148641976) 
# choosing to use filtered data, comment if you want to use the raw data
A=Af

x = c(1:length(A))  


# Divide data according to years
A2015<-A[1 :12]
A2016<-A[13:24]
A2017<-A[25:36]
A2018<-A[37:48]
A2019<-A[49:60]
A2020<-A[61:72]

# Calculate mean value for each year
m_A15=mean(A2015)
m_A16=mean(A2016)
m_A17=mean(A2017)
m_A18=mean(A2018)
m_A19=mean(A2019)
m_A20=mean(A2020)

# Calculate std for each year
sd_A15=sd(A2015)
sd_A16=sd(A2016)
sd_A17=sd(A2017)
sd_A18=sd(A2018)
sd_A19=sd(A2019)
sd_A20=sd(A2020)

# manual definition of peak coordinates
peaks<-c(A2015[7],A2016[7],A2017[7],A2018[8],A2019[7],A2020[7])
xpeaks<-c(7      ,7+12    ,7+12*2  ,8+12*3  ,7+12*4  ,7+12*5  )


#group means and stds into arrays for easy interpretation
sds<-c(sd_A15,sd_A16,sd_A17,sd_A18,sd_A19,sd_A20)
means<-c(m_A15,m_A16,m_A17,m_A18,m_A19,m_A20)
# means=-10.79695 -11.03318 -10.86451 -10.74070 -10.86557 -10.78863
# stds= 0.4902407 0.5133871 0.3188508 0.1506143 0.1365497 0.2012161

# these are for drawing the polygon, L represent the lower value of STD on the graph and H the higher
sds_L<-means-sds/2
sds_H<-means+sds/2

# these are the corresponsing Julies were the std will be drawn on
sds_X<-c(7      ,7+12    ,7+12*2  ,7+12*3  ,7+12*4  ,7+12*5  )
xm<-sds_X
ym<-c(m_A15,m_A16,m_A17,m_A18,m_A19,m_A20)

# calculate linear regression of the standard deviation 
regSds = lm(sds~sds_X)
# calculate linear regression of all points of backscattered coefficient included on the graph
reg = lm(A~x)
# calculate linear regression of peak blooming backscattered coefficients on the graph
regPeaks = lm(peaks~xpeaks)


# define name and size of image to be exported
png(filename="SARphenology1.png", width = 2000, height = 1100)


# plot backscattered coefficient as points - used to start the plot, points drawn again later
plot(x, A,ylab="Backscattered Coefficient (DB)", lwd=2,cex.lab=3,cex.axis=2.5)
# it is moving the label inside the plot so that I can copy it from paint, otherwise it is cut outside the image
#title(ylab="Backscattered Coefficient (DB)", mgp=c(-2.5,1,0), cex.lab=3)

# draw vertical lines for Januaries
abline(v=1,col="gray",lwd = 1.6)
abline(v=13,col="gray",lwd = 1.6)
abline(v=25,col="gray",lwd = 1.6)
abline(v=37,col="gray",lwd = 1.6)
abline(v=49,col="gray",lwd = 1.6)
abline(v=61,col="gray",lwd = 1.6)
abline(v=73,col="gray",lwd = 1.6)

# draw vertical dotted lines for Julies
abline(v=7,col="gray",type="l",lty=3)
abline(v=19,col="gray",type="l",lty=3)
abline(v=31,col="gray",type="l",lty=3)
abline(v=43,col="gray",type="l",lty=3)
abline(v=55,col="gray",type="l",lty=3)
abline(v=67,col="gray",type="l",lty=3)


# Draw polygon and segments of std deviation trend
polygon(c(sds_X,rev(sds_X)),c(sds_L,rev(sds_H)),col="papayawhip",border="papayawhip")
segments(sds_X, sds_L, sds_X, sds_H, col="orange", lwd=9,)

#Draw line connecting points of backscattered coefficients and redraw points of backcoe
lines(x,A,col="black",lwd = 3.6)
points(x,A,lwd = 3)

# add trend of the standard deviation to the graph
abline(regSds,col="green",lwd = 3.7)
# add trend of all points of backscattered coefficients on the graph
abline(reg,col="blue",lwd = 3.7)
# add trend of peak blooming backscattered coefficients on the graph
abline(regPeaks,col="green",lwd = 3.7)





# draw points at peak blooming
points(xpeaks,peaks, cex=.8, pch=4, col="green",lwd = 7)

# draw points at mean backcoe of each year
points(xm,ym, cex=.8, pch=3, col="darkgreen",lwd = 7)         



# draw legend table
 op <- par(cex = 2.3) # font size
legend(x = "bottomright",  legend = c("Backscattered Coefficient - BC ", "Annual Mean BC", "Annual Peak BC", "Annual Standard Deviation of BC",  "Backscattered Coefficient", "Peak Blooming Trend (y=-10.221-0.0055x)", "Average Trend (y=-10.944+0.0026x)", "January", "July"), lty = c(0, 0,0, 1, 1, 1, 1, 1, 2), pch = c(1, 3, 4, NA, NA, NA, NA, NA, NA),  col = c("black","darkgreen", "green", "orange", "black", "green",  "blue","gray","gray"), lwd = c(2,2,2,5,2,2,1.3,1))     


dev.off()

# print linear regression of the standard deviation 
print(regSds) 
# print linear regression of all bascattered coefficients
print(reg) 
# print linear regression of all peak bascattered coefficients
print(regPeaks) 
