#  @author Dr. Milto Miltiadou
#  @date 9th Dec 2021
#  @version 1.0

## package CovertToDB
#  @brief A script that takes as input a csv file, whose first column and first row are labels and convert it from digital numbers to Decibel using the formula 10*log10(abs(value))
# 
# how to run: python ConvertToDB.py -in <input.csv> -out <output.csv>
# example: python "/home/milto/Documents/ASTARTE/Scripts/WP6/timeseriesInterpretation/ConvertToDB.py" -in "/home/milto/Documents/ASTARTE/ASTARTE_sample_data/level4/Sentinel-1/ASCENDING/VH/heights/all.csv" -out "/home/milto/Documents/ASTARTE/ASTARTE_sample_data/level4/Sentinel-1/ASCENDING/VH/heights/Sentinel1_Asc_VH_all_heigh_DB.csv"
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
     
params = vars(parser.parse_args())
inpCsv = params["in"     ]
outCsv = params["out"    ]

print ("inImgDir     = ", inpCsv) 
print ("outImgDir    = ", outCsv)
count =0
mean = 0.0
finp = open(inpCsv,"r+")
for line in finp:
   print (count)
   if count==1:
      my_list = line.split(",")
      count2=0
      for item in my_list:
         if count2!=0:
            mean+=float(item)
         count2+=1
      mean = mean/float(count2-1)
   count+=1
finp.close()


count =0
std = 0.0
finp = open(inpCsv,"r+")
for line in finp:
   if count==1:
      my_list = line.split(",")
      count2=0
      for item in my_list:
         if count2!=0:
            std+=(float(item)-mean)*(float(item)-mean)
         count2+=1
      std/=float(count2-1)
      std=math.sqrt(std)
   count+=1
finp.close()


print ("mean, std: ", mean, std)

count =0
fout = open(outCsv,"w+")
finp = open(inpCsv,"r+")


for line in finp:
   if count==0:
      if(line[len(line)-1]=="\n"):
         fout.write(line[0:len(line)-1])
      else:
         fout.write(line)
   if count==1:
      my_list = line.split(",")
      count2=0
      for item in my_list:
         if count2==0:
             if count!=0:
                fout.write("\n")
             fout.write(item)
             count2+=1
         else:
             if check_float(item):
                result=float(item)
                fout.write(",")
                db=(result-mean)/(4*std)+0.5
                if(db<0):
                   fout.write(str(0.0))
                else:
                   fout.write(str(db))
             else:   
                fout.write(",")
             count2+=1
   count+=1



finp.close()
fout.close()


print ("   ***   EXIT   ***\n")


