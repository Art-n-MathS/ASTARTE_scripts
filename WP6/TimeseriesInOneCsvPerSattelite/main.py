## package main
#  @brief 
#
#
#  @author Dr. Milto Miltiadou
#  @date 5th Oct 2020
#  @version 1.0

import numpy as np
import argparse
import sys
import os
import numpy as np
import glob
import CsvIn
#import re

#import subprocess
#import FoldersManager
#import Csv
#import GeoFunctions


#  @details python main.py -in <inputDir> -out <outputDir> -zones <[zone1,zone2,...,zoneN]>
#  @notes This is for testing that libraries are installed properly. It just reads a GeoTIFF image and makes a copy


# parsing command line inputs
parser = argparse.ArgumentParser()
parser.add_argument("-in",
     required=True,
     help="Directory of .csv files from one sattelite",
     metavar='<string>')
parser.add_argument("-out",
     required=True,
     help="file.csv that the combined bascattered coefficient will be exported",
     metavar='<string>')
parser.add_argument("-zones",
     required=True,
     help="a list of zones that will be merged into one and exported into that csv file, comma separated without spaces in between",
     metavar='<string>')


params       = vars(parser.parse_args())
inImgDir     = params["in"   ]
outCsvDir    = params["out"  ]
zonesStr     = params["zones"]
zonesList    = zonesStr.split(',') # ['1','2','3','4']

print ("inImgDir     = ", inImgDir ) 
print ("outImgDir    = ", outCsvDir)
print ("zonesStr     = ", zonesStr )
print ("zones        = ", zonesList)
cdir=os.getcwd()

# create folders structure if it is missing
# dirs=FoldersManager.creatFolders(inImgDir,outCsvDir)
  

os.chdir(inImgDir)
csvFiles = glob.glob(inImgDir + "/*.csv")
csvFiles.sort()

ListAveCoes=[]
ListtPixes =[]

for f in range(len(csvFiles)): 
    print (csvFiles[f])
    [aveCoe,tPixels] = CsvIn.getAveBackAndArea(csvFiles[f],zonesList)
    ListAveCoes+=[aveCoe]
    ListtPixes+=[tPixels]

print ("csvFiles",csvFiles)
print ("ListAveCoes=",ListAveCoes)
print ("ListtPixes=",ListtPixes)
print (len(csvFiles), len(ListAveCoes), len(ListtPixes))

if (len(csvFiles)!=len(ListAveCoes) and len(ListAveCoes)!=len(ListtPixes)):
   print ("ERROR: size of list with names of files, ave Coes and no of Pixels are not equal!")
   exit(1)

# exprt data to two .csv files
zonesStr = zonesStr.replace(",", " ")

faves= open(outCsvDir,"w+")
faves.write("Filenames,")
for i in range(len(csvFiles)-1):
   head, tail = os.path.split(csvFiles[i])
   faves.write("%s,"% tail) #  [17:25]) # for Sentinel-1
head, tail = os.path.split(csvFiles[len(csvFiles)-1])
faves.write("%s\n"%tail) #  [17:25]) # for Sentinel-1
faves.write("%s,"%zonesStr)
for i in range(len(ListAveCoes)-1):
   faves.write("%f,"%ListAveCoes[i])
faves.write("%f"%ListAveCoes[len(ListAveCoes)-1])
faves.close()

outCsvDir=outCsvDir+"pix.csv"
faves= open(outCsvDir,"w+")
faves.write("Filenames,")
for i in range(len(csvFiles)-1):
   head, tail = os.path.split(csvFiles[i])
   faves.write("%s,"% tail) #  [17:25]) # for Sentinel-1
head, tail = os.path.split(csvFiles[len(csvFiles)-1])
faves.write("%s\n"%tail) #  [17:25]) # for Sentinel-1
faves.write("%s,"%zonesStr)
for i in range(len(ListtPixes)-1):
   faves.write("%f,"%ListtPixes[i])
faves.write("%f"%ListtPixes[len(ListtPixes)-1])
faves.close()




 
print ("   ***   EXIT   ***\n")





