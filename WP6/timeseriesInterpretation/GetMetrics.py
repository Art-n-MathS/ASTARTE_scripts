#  @author Dr Milto Miltiadou
#  @date 1st March 2021
#  @version 1.0

## package SplitAccordingToYear
#  @brief A script that takes as input a csv file, whose first column and first row are labels and extract metrics (peak amplitude, sum of average bacscattered coefficient, pulse width, start of asceding/blooming, end of descending/blooming) useful to modeling the data
# 
# how to run: python ConvertToDB.py -in <input.csv> -out <putDir> -minWidth <minWidth>
# example: python "/home/milto/Documents/ASTARTE/Scripts/WP6/timeseriesInterpretation/ConvertToDB.py" -in "/home/milto/Documents/ASTARTE/ASTARTE_sample_data/level4/Sentinel-1/ASCENDING/VH/heights/all.csv" -out "/home/milto/Documents/ASTARTE/ASTARTE_sample_data/level4/Sentinel-1/ASCENDING/VH/heights/heightyears" -minWidth 3
# 



import argparse
import sys
import os
import math
import numpy as np
from scipy.signal import chirp, find_peaks, peak_widths
import matplotlib.pyplot as plt
from copy import deepcopy

def check_float(potential_float):
    try:
        float(potential_float)
        return True
    except ValueError:
        return False
        
# parsing command line inputs

import argparse
import sys
import os
import math



def check_float(potential_float):
    try:
        float(potential_float)
        return True
    except ValueError:
        return False
        
# parsing command line inputs
parser = argparse.ArgumentParser()
parser.add_argument("-in",
     required=True,
     help="Name of input CSV file",
     metavar='<string>')
parser.add_argument("-out",
     required=True,
     help="Name of CSV file to be exported",
     metavar='<string>')
parser.add_argument("-minWidth",
     required=True,
     help="Name of CSV file to be exported",
     metavar='<string>')
     
params = vars(parser.parse_args())
inpCsv  = params["in"          ]
outCsv  = params["out"         ]
minWidth= float(params["minWidth"])

print ("inImgDir     = ", inpCsv  ) 
print ("outImgDir    = ", outCsv  )
print ("minWidth     = ", minWidth)

count =0

fout = open(outCsv,"w+")
finp = open(inpCsv,"r+")

noOfLabels=6
columnLabels=[]
metrics=[]
metrics+=[[]] #0 Mean
metrics+=[[]] #1 PeakAmplitude
metrics+=[[]] #2 PeakTime
metrics+=[[]] #3 PulseWidth
metrics+=[[]] #4 MeanOfPulses
metrics+=[[]] #5 StdOfPulses

labels=[]
for line in finp:
   if count==0:
      labels = line.split(",")
      fout.write("%s,Mean, PeakAmplitude, PeakTime, PulseWidth" % labels[0])
   else:
      my_list = line.split(",")
      if len(my_list)<0:
         sys.exit("ERROR: File empty / No Columns")
      columnLabels+=[my_list[0]]
      
      # Getting SUM
      sumV=0.0
      fitems=[]
      for item in my_list:
        if check_float(item):
           result=float(item)
           sumV+=result 
           fitems+=[result] # save all items as floats into an array
      metrics[0]+=[sumV/12.0] #0 MEAN
      
      
      # get information about peaks
      peaks, _ = find_peaks(fitems)
      widths=peak_widths(fitems, peaks, rel_height=1)

      # peaks1=list(peaks)
      
      peaks1=[]
      for pl in range (len(peaks)):
         peaks1+=[peaks[pl]]
         
      widths0=list(widths[0])
      widths1=list(widths[1])
      widths2=list(widths[2])
      poppinItems=[]
      for p in range(len(peaks)):
         print ("+++++++++++++++++++++++++++++")
         print (len(widths))
         print (minWidth)
         print (widths[0][p]) 
         print (p, len(peaks), len(peaks1), peaks, peaks1)
         print ("+++++++++++++++++++++++++++++")
         if widths[0][p] < minWidth : 
            poppinItems+=[p]
           
      p=len(poppinItems)-1
      while(p>=0):
         widths0.pop(p)
         widths1.pop(p)
         widths2.pop(p)
         peaks1.pop(p)
         p-=1
           

      metrics[1]+=[fitems[int(peaks1[0])]] #1 PeakAmplitude


      if (len(peaks1)!=len(widths1) and len(peaks1)!=1):
         print ("WARNING: Number of peaks and widths should have been equal to one")
         
      plabels=[]
      for p in range(len(peaks1)):
         plabels+=[labels[peaks1[p]+1]] #+1 since labels inclue the first column within the labels list
      
      month=int(plabels[0][4:6])   

      metrics[2]+=[month]        #2 PeakTime
            
      metrics[3]+=[widths0[0]] #3 PulseWidth
      
      metrics[4]+=[widths1[0]] #4 MeanOfPulses
      
      metrics[5]+=[widths2[0]] #5 StdOfPulses
      
   count+=1


#print ("-----", columnLabels)
#print (metrics, count, range(count-1))
for c in range(count-1): # -1 because of the labels
   fout.write("\n%s"%columnLabels[c])
   for i in range (0,4):
      #print (i, c, metrics [i][c])
      fout.write(",%s"%metrics[i][c]) 

finp.close()
fout.close()

#plt.plot(fitems)
#plt.plot(peaks,fitems[peaks[0]],"x")
#plt.show()
print ("   ***   EXIT   ***\n")


