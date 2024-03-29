## package Apply Filter
#  @brief A script that takes as input a csv file, whose first column and first row are labels and applies an input filter 
# 
# @brief how to run: python ConvertToDB.py -in <input.csv> -out <output.csv> -filter <f1,f2,f3,f4,f5>
# @brief where the numbers of numbers followed after the tag "-filter should be odd and defines the filter to be applied. No spaces between commas. 
# 
# @brief example: python "/home/milto/Documents/ASTARTE/Scripts/WP6/timeseriesInterpretation/ApplyFilter.py" -in "/home/milto/Documents/ASTARTE/ASTARTE_sample_data/level4/Sentinel-1/ASCENDING/VH/heights/Sentinel1_Asc_VH_all_heigh_DB.csv" -out "/home/milto/Documents/ASTARTE/ASTARTE_sample_data/level4/Sentinel-1/ASCENDING/VH/heights/Sentinel1_Asc_VH_all_heigh_DB_filtered.csv" -filter 1,2,5,2,1 
# 
#
#
#  @author Dr. Milto Miltiadou
#  @date 23th of Feb 2021
#  @version 1.0


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
parser.add_argument("-filter",
     required=True,
     help="Filter to be applied",
     metavar='<string>')
     
         
params    = vars(parser.parse_args())
inpCsv    = params["in"     ]
outCsv    = params["out"    ]
filterIn  = params["filter" ]
filterList= filterIn.split(',')
filterList=list(map(float, filterList))

print ("inImgDir     = ", inpCsv    ) 
print ("outImgDir    = ", outCsv    )
print ("filterIn     = ", filterList)


fout = open(outCsv,"w+")
finp = open(inpCsv,"r+")
clabels=[]
items  =[]
count=0
for line in finp:
   if count==0:
      if(line[len(line)-1]=="\n"): 
         fout.write(line[0:len(line)-1])
      else:
         fout.write(line)
      labels=line.split(",")
      noItemsPerLine=len(labels)
   else:
      my_list = line.split(",")
      count2=0
      for item in my_list:
         if count2==0:
             clabels+=[item]
         else:
             if check_float(item):
                result=float(item)
                items+=[result]
             else:   
                items+=[None]
             
         count2+=1
   count+=1

itemsIndex=0
itemsPerLine=noItemsPerLine-1 # removing count for label
filterLen=len(filterList)
midFilter=math.floor(float(filterLen)/2.0) # e.g. 0 1 (2) 3 4 
print (itemsPerLine, filterLen, midFilter)

sitemsIndex=0
for l in range(len(clabels)): 
   fout.write("\n")
   fout.write(clabels[l])
   filterSum=0
   Sum=0
   itemsIndex=midFilter+l*itemsPerLine
   filterIndex=midFilter
   
   # left half filter
   
  
   eitemsIndex=math.ceil(filterLen/2.0)-1+l*itemsPerLine
   sfilter=math.ceil(filterLen/2.0)
   efilter=len(filterList)


   while sitemsIndex<eitemsIndex:
      sfilter=midFilter
      sumN=0.0
      sumP=0.0
      while sfilter<efilter:
         if(items[sitemsIndex+sfilter-midFilter]!=None and check_float(items[sitemsIndex+sfilter-midFilter])):
            sumN+=items[sitemsIndex+sfilter-midFilter]*filterList[sfilter]
            sumP+=filterList[sfilter]

         sfilter+=1
      if sumP>0:
         sumN=sumN/sumP
         fout.write(",")
         fout.write(str(sumN))

         sumN=0.0
         sumP=0.0
      else:
         fout.write(",")
      sitemsIndex+=1

      
      
      
      
   
     
   # middle complete filter
   sitemsIndex=midFilter+l*itemsPerLine 
   eitemsIndex=sitemsIndex+itemsPerLine-filterLen+1
   sfilter=0
   efilter=len(filterList)


   while sitemsIndex<eitemsIndex:
      sfilter=0
      sumN=0.0
      sumP=0.0
      while sfilter<efilter:
         if(items[sitemsIndex+sfilter-midFilter]!=None and check_float(items[sitemsIndex+sfilter-midFilter])):
            sumN+=items[sitemsIndex+sfilter-midFilter]*filterList[sfilter]
            sumP+=filterList[sfilter]
         sfilter+=1
      if sumP>0:
         sumN=sumN/sumP
         fout.write(",")
         fout.write(str(sumN))
         sumN=0.0
         sumP=0.0
      else:
         fout.write(",")
      sitemsIndex+=1
      
   # end complete filter

   eitemsIndex=sitemsIndex+math.ceil(filterLen/2.0)-1
   sfilter=0
   efilter=len(filterList)

   ofilter=1
   while sitemsIndex<eitemsIndex:

      sfilter=0
      sumN=0.0
      sumP=0.0
      while sfilter<efilter-ofilter:
         if(items[sitemsIndex+sfilter-midFilter]!=None and check_float(items[sitemsIndex+sfilter-midFilter])):
            sumN+=items[sitemsIndex+sfilter-midFilter]*filterList[sfilter]
            sumP+=filterList[sfilter]

         sfilter+=1
      if sumP>0:
         sumN=sumN/sumP
         fout.write(",")
         fout.write(str(sumN))

         sumN=0.0
         sumP=0.0
      else:
         fout.write(",")
      sitemsIndex+=1
      ofilter+=1

   
   
      
     


finp.close()
fout.close()


print ("   ***   EXIT   ***\n")
