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
import math
#import re

#import subprocess
#import FoldersManager
#import Csv
#import GeoFunctions

# NOTE: LAST IMAGE OF THE TIME SERIES IS IGNORED 
# QUICK FIX: COPY PASTE AN IMAGE AND RENAME IT SO THAT IT SEEMS TO BE THE LAST IN THE SERIES, 
# A ZERO WILL APPEAR AT THE END THAT CAN BE IGNORED

#  @details python main.py -in <inputDir> -out <outputDir> -zones <[zone1,zone2,...,zoneN]> -MS <Starting Month> -ME <Ending Month> -YS <Starting year> -YE <endinding year>
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
parser.add_argument("-MS",
     required=True,
     help="starting month of the time series",
     metavar='<string>')
parser.add_argument("-ME",
     required=True,
     help="End month of the time series",
     metavar='<string>')
parser.add_argument("-YS",
     required=True,
     help="Start year of the time series",
     metavar='<string>')
parser.add_argument("-YE",
     required=True,
     help="End year of the time series",
     metavar='<string>')
parser.add_argument("-IDS",
     required=True,
     help="Index of first character that the date starts in the name of the image",
     metavar='<string>')
     
     


params       = vars(parser.parse_args())
inImgDir     = params["in"     ]
outCsvDir    = params["out"    ]
zonesStr     = params["zones"  ]
zonesList    = zonesStr.split(',') # ['1','2','3','4']
MMS          = int(params["MS" ] )
MME          = int(params["ME" ] )
YYYYS        = int(params["YS" ] )
YYYYE        = int(params["YE" ] )
IDS          = int(params["IDS"] )

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
   dates=dates+[tail[IDS:(IDS+8)]]
   
dates.sort()




indexes = list(range(0, len(dates)))

for d in range(len(dates)):
   for i in range(len(csvFiles)):
      head, tail = os.path.split(csvFiles[i])
      if(dates[d]==tail[IDS:(IDS+8)]):
         indexes[d]=i


        
for i in indexes: 
   ead, tail = os.path.split(csvFiles[i])

     
   

# exprt data to two .csv files
# preparation
zonesStr = zonesStr.replace(",", " ")

# creating names of files
outCsvDirPix  =outCsvDir+"_pix.csv"
outCSvDirNoAve=outCsvDir+"_noAve.csv"
oitCSvDirMeto =outCsvDir+"_Meto.csv"
outCsvDirNotCleaned=outCsvDir+"_notCleaned.csv"

# opening/creating files
favesPix  = open(outCsvDirPix  ,"w+")
favesNoAve= open(outCSvDirNoAve,"w+")
fmeteoOut = open(oitCSvDirMeto ,"w+")

# Adding first label in files
favesPix.write  ("Filenames,")
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
   favesPix.write  ("%s,"% tail[IDS:(IDS+8)])
   favesNoAve.write("%s,"% tail[IDS:(IDS+8)])
   fmeteoOut.write("%s,"% tail[IDS:(IDS+8)])
   # Also creating a list with meteo corresponding data
   value=0.0
   while (1 and date[8:10]): # day, month, year
      #print ("All: " , date, tail[17:25]) 
      #print ("Day: ", date[0:2], tail[23:25])
      #print ("Month: " , date[3:5],tail[21:23])
      #print ("Year: " , date[8:10],tail[19:21])
      #print ("-------------------")
      meteoLine=fMeteoData.readline()
      if (meteoLine==""):
         value=float(value)
         break
      meteoLine=meteoLine[0:len(meteoLine)-2]
      meteoData=str(meteoData)
      meteoData=meteoLine.split(",")
      [date,value]=meteoData
      if(value==''):
         value=0.0
      else:
         value=float(value)
      if(date[0:2]==tail[(IDS+6):(IDS+8)] and date[3:5]==tail[(IDS+4):(IDS+6)] and date[8:10]==tail[(IDS+2):(IDS+4)]): 
         break

   MeteoValuesList+=[value]

head, tail = os.path.split(csvFiles[indexes[len(indexes)-1]])
favesPix.write  ("%s\n"%tail[IDS:(IDS+8)]) 
favesPix.write  ("%s,"%zonesStr)  # zonesStr is the label of the 2nd column
favesNoAve.write("%s\n"%tail[IDS:(IDS+8)]) 
favesNoAve.write("%s,"%zonesStr)
fmeteoOut.write("%s\n"%tail[IDS:(IDS+8)]) 
fmeteoOut.write("%s,"%zonesStr)



value=0.0
while (1 and date[8:10]): # day, month, year
   #print ("All: " , date, tail[17:25]) 
   #print ("Day: ", date[0:2], tail[23:25])
   #print ("Month: " , date[3:5],tail[21:23])
   #print ("Year: " , date[8:10],tail[19:21])
   #print ("-------------------")
   meteoLine=fMeteoData.readline()
   meteoLine=meteoLine[0:len(meteoLine)-2]
   meteoData=str(meteoData)
   meteoData=meteoLine.split(",")
   if (meteoLine==""):
      value=float(value)
      break
   [date,value]=meteoData
   if(value==''):
      value=0.0
   else:
      value=float(value)
   if(date[0:2]==tail[(IDS+6):(IDS+8)] and date[3:5]==tail[(IDS+4):(IDS+6)] and date[8:10]==tail[(IDS+2):(IDS+4)]): 
      break
      
MeteoValuesList+=[value]
   
   



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



MMC=MMS
YYYYC=YYYYS
datesStr=[]
while(1):
   if (MMC==10 or MMC==11 or MMC==12):
      datesStr+= [str(YYYYC)+str(MMC)]
   else:
      datesStr+= [str(YYYYC)+"0"+str(MMC)]
   if (MMC==MME and YYYYC==YYYYE):
      break
   MMC+=1
   MMC=MMC%12
   if MMC==0:
      MMC=12
   if MMC==1:
      YYYYC+=1


# Define METEO THRESHOLD
MeteoThres=7.1
ListAveCoesClean=[] # -1000 for meteo below thres

for i in range(len(ListAveCoes)):
   if (MeteoValuesList[i]<MeteoThres):
      ListAveCoesClean+=[ListAveCoes[i]]
   else:
      ListAveCoesClean+=[ListAveCoes[i]]
      
print ("ListAveCoesClean",ListAveCoesClean)
print ("ListAveCoes",ListAveCoes)
print ("MeteoValuesList",MeteoValuesList)

i=0

sumAves=[]
for d in range(len(datesStr)):
   currentMonth=datesStr[d]
   sumAve=0
   pixs=0 
   head, tail = os.path.split(csvFiles[indexes[i]])
   #print (currentMonth[4:6],tail[21:23])
   while (i<len(indexes)-1 and currentMonth[4:6]==tail[(IDS+4):(IDS+6)] and currentMonth[2:4]==tail[(IDS+2):(IDS+4)]): 
      pixs=pixs+1
      if(ListAveCoesClean[indexes[i]]>-999):
         sumAve=sumAve+float(ListAveCoesClean[indexes[i]]) 
      else:
         pixs-=1
      i=i+1
      head, tail = os.path.split(csvFiles[indexes[i]])
      
   if (pixs!=0):
      sumAve=sumAve/float(pixs)
   else:
      sumAve=-1000         
   # else sumeAve=0   
   sumAves+=[sumAve]

if (len(sumAves)!=len(datesStr)):
   print ("ERROR: sumAves not equal to datesStr!!")
   exit(1)
   
# export average back coe per month
faves1    = open(outCsvDir     ,"w+")
faves1.write    ("Filenames")  # label of 1st row
for i in range(len(datesStr)):
   faves1.write(",%s"% datesStr[i])
faves1.write("\n")


faves1.write    ("%s - cleaned by Meteo"%zonesStr) # label of 2nd row
for i in range(len(datesStr)):
      result=sumAves[i]
      if result > -999 :
         faves1.write(",%5f"% (result))
      else:
         faves1.write(",")
faves1.write("\n")
faves1.close()


i=0
sumAves2=[]
for d in range(len(datesStr)):
   currentMonth=datesStr[d]
   sumAve=0
   pixs=0 
   head, tail = os.path.split(csvFiles[indexes[i]])


   while (i<len(indexes)-1 and currentMonth[4:6]==tail[(IDS+4):(IDS+6)] and currentMonth[2:4]==tail[(IDS+2):(IDS+4)]): 
      pixs=pixs+1
      if(ListAveCoes[indexes[i]]>0):
         sumAve=sumAve+float(ListAveCoes[indexes[i]]) 
      else:
         pixs-=1     
      #sumAve=sumAve+float(ListAveCoes[indexes[i]])
      i=i+1
      head, tail = os.path.split(csvFiles[indexes[i]])
            
   if (pixs>0):
      sumAve=sumAve/float(pixs)
   else:
      sumAve=-1000         
   # else sumeAve=0   
   sumAves2+=[sumAve]


# export average back coe per month
faves2    = open(outCsvDirNotCleaned,"w+")
faves2.write    ("Filenames")  # label of 1st row
for i in range(len(datesStr)):
   faves2.write(",%s"% datesStr[i])
faves2.write("\n")


faves2.write    ("%s - all data"%zonesStr) # label of 2nd row
for i in range(len(datesStr)):
      result=sumAves2[i]
      if result > -999 :
         faves2.write(",%5f"% (result))
      else:
         faves2.write(",")
faves2.write("\n")
faves2.close()

for i in range(len(datesStr)):
   if float(sumAves[i])<= (-999.0) :
      sumAve=0.0
   if float(sumAves2[i])<= (-999.0) :
      sumAves2[i]=0.0

print ("ListAveCoesClean",ListAveCoesClean)
print ("ListAveCoes",ListAveCoes)
print ("MeteoValuesList",MeteoValuesList)
print ("sumAves2",sumAves2)
print ("sumAves",sumAves)

print ("   ***   EXIT   ***\n")

