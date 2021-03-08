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

for line in finp:
   if count==0:
      my_list = line.split(",")
      fout.write("%s,Sum, peakAmplitude, PulseWidth, Start, End" % my_list[0])
   else:
      my_list = line.split(",")
      fout.write("\n%s"%my_list[0])
      for m in range(4):
         if m==0: #Sum
            print ("Sum")
            sumV=0.0
            for item in my_list:
               if check_float(item):
                  result=float(item)
                  sumV+=result 
            fout.write(",%f"%sumV)     
         if m==1: # peakAmplitude
            print ("peakAmplitude")
   count+=1


finp.close()
fout.close()


print ("   ***   EXIT   ***\n")


