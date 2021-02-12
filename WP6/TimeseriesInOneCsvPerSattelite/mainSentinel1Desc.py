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
    # print (csvFiles[f])
    [aveCoe,tPixels] = CsvIn.getAveBackAndArea(csvFiles[f],zonesList)
    ListAveCoes+=[aveCoe]
    ListtPixes+=[tPixels]

# print ("csvFiles",csvFiles)
# print ("ListAveCoes=",ListAveCoes)
# print ("ListtPixes=",ListtPixes)
print (len(csvFiles), len(ListAveCoes), len(ListtPixes))

if (len(csvFiles)!=len(ListAveCoes) and len(ListAveCoes)!=len(ListtPixes)):
   print ("ERROR: size of list with names of files, ave Coes and no of Pixels are not equal!")
   exit(1)

dates= []
for i in range(len(csvFiles)):
   head, tail = os.path.split(csvFiles[i])
   dates=dates+[tail[17:25]]
   
dates.sort()

indexes = list(range(0, len(dates)))

for d in range(len(dates)):
   for i in range(len(csvFiles)):
      head, tail = os.path.split(csvFiles[i])
      if(dates[d]==tail[17:25]):
         indexes[d]=i
         
         
for i in indexes: 
   ead, tail = os.path.split(csvFiles[i])
   #print (i, tail[17:25])
     
   

# exprt data to two .csv files
# preparation
zonesStr = zonesStr.replace(",", " ")

# creating names of files
outCsvDirPix  =outCsvDir+"_pix.csv"
outCSvDirNoAve=outCsvDir+"_noAve.csv"
oitCSvDirMeto =outCsvDir+"_Meto.csv"

# opening/creating files
favesPix  = open(outCsvDirPix  ,"w+")
favesNoAve= open(outCSvDirNoAve,"w+")
faves1    = open(outCsvDir     ,"w+")
fmeteoOut = open(oitCSvDirMeto ,"w+")

# Adding first label in files
favesPix.write  ("Filenames,")
faves1.write    ("Filenames,")
favesNoAve.write("Filenames,")
fmeteoOut.write ("Filenames,")

# Loading file for meto data
meteoDir      ="/home/milto/Documents/ASTARTE/ASTARTE_sample_data/Ave_DailyRain1992_2019_3days.csv"
fMeteoData= open(meteoDir      ,"r" )
meteoLine=fMeteoData.readline()
meteoLine=fMeteoData.readline()
meteoLine=meteoLine[0:len(meteoLine)-2]
meteoData=meteoLine.split(".")
[date,value]=meteoData
value=float(value)
MeteoValuesList=[]

# MeteoData = /home/milto/Documents/ASTARTE/ASTARTE_sample_data/Ave_DailyRain1992_2019_3days.csv

#first line is the labels

# exporting labels in csvs for average back coe, sum pixels, and meteo data
for i in range(len(indexes)-1):
   head, tail = os.path.split(csvFiles[indexes[i]])
   favesPix.write  ("%s,"% tail[17:25])
   favesNoAve.write("%s,"% tail[17:25])
   fmeteoOut.write("%s,"% tail[17:25])
   # Also creating a list with meteo corresponding data
   
   while (1): # day, month, year
      #print ("All: " , date, tail[17:25]) 
      #print ("Day: ", date[0:2], tail[23:25])
      #print ("Month: " , date[3:5],tail[21:23])
      #print ("Year: " , date[8:10],tail[19:21])
      #print ("-------------------")
      meteoLine=fMeteoData.readline()
      meteoLine=meteoLine[0:len(meteoLine)-2]
      meteoData=str(meteoData)
      meteoData=meteoLine.split(",")
      [date,value]=meteoData
      if(value==''):
         value=0.0
      else:
         value=float(value)
      if(date[0:2]==tail[23:25] and date[3:5]==tail[21:23] and date[8:10]==tail[19:21]):
         break
   #print (date, tail[17:25], value, "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++!") 
   MeteoValuesList+=[value]

head, tail = os.path.split(csvFiles[indexes[len(indexes)-1]])

favesPix.write  ("%s\n"%tail[17:25]) 
favesPix.write  ("%s,"%zonesStr)  # zonesStr is the label of the 2nd column
favesNoAve.write("%s\n"%tail[17:25]) 
favesNoAve.write("%s,"%zonesStr)
fmeteoOut.write("%s\n"%tail[17:25]) 
fmeteoOut.write("%s,"%zonesStr)




# exporting values in csvs for average back coe, sum pixels, and meteo data
for i in range(len(indexes)-1):
   favesPix.write  ("%i,"%ListtPixes [indexes[i]])
   favesNoAve.write("%f,"%ListAveCoes[indexes[i]])
   
   fmeteoOut.write("%f,"%MeteoValuesList[indexes[i]])
favesPix.write("%i"%ListtPixes[indexes[len(indexes)-1]])
favesNoAve.write("%f"%ListAveCoes[indexes[len(indexes)-1]])

#fmeteoOut.write("%f"%MeteoValuesList[indexes[len(indexes)-1]])

favesNoAve.close()
favesPix.  close()
fmeteoOut .close()
fMeteoData.close()

# export average back coe per month
i=0
head, tail = os.path.split(csvFiles[indexes[0]])
tail1= tail[17:23]
faves1.write("%s,"% tail[17:23])
while i<len(indexes)-1:
   head, tail = os.path.split(csvFiles[indexes[i]])
   if (tail1 != tail[17:23]):
      faves1.write("%s,"% tail[17:23])
   i=i+1
   tail1= tail[17:23]
faves1.write("%s\n"%tail[17:23]) 


faves1.write    ("%s,"%zonesStr)
i=0
while i<len(indexes)-1:
   sumAve=0
   pixs=0
   nO=0
   head, tail = os.path.split(csvFiles[indexes[i]])
   currentMonth=tail[21:23]
   while (i<len(indexes) and currentMonth==tail[21:23]):
      pixs=pixs+1
      sumAve=sumAve+float(ListAveCoes[indexes[i]])
      i=i+1
      head, tail = os.path.split(csvFiles[indexes[i]])
      
   sumAve=sumAve/float(pixs)

   faves1.write("%f,"%(sumAve))

faves1.write("%f"%ListAveCoes[indexes[len(indexes)-1]])


faves1.close()




 
print ("   ***   EXIT   ***\n")





