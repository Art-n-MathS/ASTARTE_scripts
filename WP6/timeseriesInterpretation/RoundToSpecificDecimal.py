#  @author Dr. Milto Miltiadou
#  @date 23th of Feb 2021
#  @version 1.0


## package RoundToSpecificDecimal
#  @brief A script that takes as input a csv file, whose first column and first row are labels and convert it from digital numbers to Decibel using the formula 10*log10(abs(value))
# 
# how to run: python ConvertToDB.py -in <input.csv> -out <output.csv> -noOfDecimal <noOfDecimal>
# example: python "/home/milto/Documents/ASTARTE/Scripts/WP6/timeseriesInterpretation/RoundToSpecificDecimal.py" -in "/home/milto/Documents/ASTARTE/ASTARTE_sample_data/level4/Sentinel-1/ASCENDING/VH/heights/Sentinel1_Asc_VH_all_heigh_DB.csv" -out "/home/milto/Documents/ASTARTE/ASTARTE_sample_data/level4/Sentinel-1/ASCENDING/VH/heights/Sentinel1_Asc_VH_all_heigh_DB_rounded.csv" -noOfDecimal 2

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
parser = argparse.ArgumentParser()
parser.add_argument("-in",
     required=True,
     help="Name of input CSV file",
     metavar='<string>')
parser.add_argument("-out",
     required=True,
     help="Name of CSV file to be exported",
     metavar='<string>')
parser.add_argument("-noOfDecimal",
     required=True,
     help="Name of CSV file to be exported",
     metavar='<string>')
     
params = vars(parser.parse_args())
inpCsv = params["in"         ]
outCsv = params["out"        ]
decimal= params["noOfDecimal"]
print ("inImgDir     = ", inpCsv ) 
print ("outImgDir    = ", outCsv )
print ("noOfDecimal  = ", decimal)
count =0

fout = open(outCsv,"w+")
finp = open(inpCsv,"r+")

for line in finp:
   if count==0:
      fout.write(line)
   else:
      my_list = line.split(",")
      count2=0
      for item in my_list:
         if count2==0:
             if count!=0:
                fout.write("\n")
             fout.write(item)
         else:
             if check_float(item):
                result=float(item)
                rresult=round(result,int(decimal))
                fout.write(",")
                fout.write(str(rresult))
             else:   
                fout.write(",")
             
         count2+=1
   count+=1


finp.close()
fout.close()


print ("   ***   EXIT   ***\n")


