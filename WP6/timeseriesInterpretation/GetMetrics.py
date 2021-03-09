#  @author Dr Milto Miltiadou
#  @date 1st March 2021
#  @version 1.0

## package SplitAccordingToYear
#  @brief A script that takes as input a csv file, whose first column and first row are labels and extract metrics (peak amplitude, sum of average bacscattered coefficient, pulse width, start of asceding/blooming, end of descending/blooming) useful to modeling the data
# 
# how to run: python ConvertToDB.py -in <input.csv> -out <putDir>
# example: python "/home/milto/Documents/ASTARTE/Scripts/WP6/timeseriesInterpretation/ConvertToDB.py" -in "/home/milto/Documents/ASTARTE/ASTARTE_sample_data/level4/Sentinel-1/ASCENDING/VH/heights/all.csv" -out "/home/milto/Documents/ASTARTE/ASTARTE_sample_data/level4/Sentinel-1/ASCENDING/VH/heights/heightyears"
# 



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

     
params = vars(parser.parse_args())
inpCsv = params["in"         ]
outCsv = params["out"        ]

print ("inImgDir     = ", inpCsv ) 
print ("outImgDir    = ", outCsv )

count =0

fout = open(outCsv,"w+")
finp = open(inpCsv,"r+")

columnLabels=[]
metrics=[]
metrics+=[[]] #0 SUM
metrics+=[[]] #1 peakAmplitude
metrics+=[[]] #2 PulseWidth
metrics+=[[]] #3 Start
metrics+=[[]] #4 End
print ("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")
print (metrics)
print ("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")
for line in finp:
   if count==0:
      my_list = line.split(",")
      fout.write("%s,Sum, peakAmplitude, PulseWidth, Start, End" % my_list[0])
   else:
      my_list = line.split(",")
      if len(my_list)<0:
         sys.exit("ERROR: File empty / No Columns")
      columnLabels+=[my_list[0]]
      
      # Getting SUM
      sumV=0.0
      for item in my_list:
        if check_float(item):
           result=float(item)
           sumV+=result 
      metrics[0]+=[sumV] #0 SUM
        
      metrics[1]+=[sumV+1] #1 peakAmplitude
      
      metrics[2]+=[2] #2 PulseWidth
      
      metrics[3]+=[3] #3 Start
      
      metrics[4]+=[4] #4 End
      
   count+=1


print ("-----", columnLabels)
print (metrics, count, range(count-1))
for c in range(count-1): # -1 because of the labels
   fout.write("\n%s"%columnLabels[c])
   for i in range (0,5):
      fout.write(",%s"%metrics[i][c])

finp.close()
fout.close()


print ("   ***   EXIT   ***\n")


