#  @author Dr. Milto Miltiadou
#  @date 1st March 2021
#  @version 1.0

## package CovertToDB
#  @brief A script that takes as input a csv file, whose first column and first row are labels and add "&" between each item and "\\" at the end of each row for each inserion of tables within LaTeX 
# @parameters[in] it takes as input the name with the path directory of the .csv file containing the table to be insterted into the LaTeX document
# @returns[out] add ".txt" to the end of the given input name and exports the table with the "&" instead of "," and "\\" at the end, the symbols, which are used in laTeX tables. It also add a "\hline" between each row, at the beginning and end of the file. 
# 
# how to run: python ConvertToDB.py -in <input.csv> 
# example: python "/home/milto/Documents/ASTARTE/Scripts/WP6/timeseriesInterpretation/ConvertToDB.py" -in "/home/milto/Documents/ASTARTE/ASTARTE_sample_data/level4/Sentinel-1/ASCENDING/VH/heights/all.csv" 
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

     
params = vars(parser.parse_args())
inpCsv = params["in"     ]

outTxt = inpCsv+".txt"


print ("inImgDir     = ", inpCsv) 
print ("outImgDir    = ", outTxt)
count =0

fout = open(outTxt,"w+")
finp = open(inpCsv,"r+")

fout.write("        \\hline\n        ")

for line in finp:

      my_list = line.split(",")
     
      for i in range(len(my_list)):
         fout.write(my_list[i])
         if (i<len(my_list)-1):
            fout.write(" & ")
         else:
            fout.write(" \\\\")
      fout.write("\n        \\hline\n        ")

finp.close()
fout.close()


print ("   ***   EXIT   ***\n")


