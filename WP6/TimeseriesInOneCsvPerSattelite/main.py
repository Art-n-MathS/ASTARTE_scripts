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
l1_list = zonesStr.split(',') # ['1','2','3','4']

print ("inImgDir     = ", inImgDir ) 
print ("outImgDir    = ", outCsvDir)
print ("zonesStr     = ", zonesStr )
print ("zones        = ", l1_list  )
cdir=os.getcwd()

# create folders structure if it is missing
# dirs=FoldersManager.creatFolders(inImgDir,outCsvDir)
  

# os.chdir(inImgDir)

# Geoimage for mask
# print (masksFile)
# mask = GeoImage.GeoImage(masksFile) # TO DO: USE FOREST SCRIPT FOR LINKING CLASS VALUE WITH PIXEL VALUE OF THE TWO IMAGES
# for d in dirs:
#    print (d)
   # get a list of images from a given direction
#    os.chdir(inImgDir)
#    imgs=FoldersManager.getFilesNames(d,".tif")
#    for img in imgs:
#       print ("**********************************************************************")
#       print ("Reading image: ", inImgDir+"/"+d+"/"+img)
      # load image
#       imgGeo = GeoImage.GeoImage(inImgDir+"/"+d+"/"+img)
      # create csv file and import info from .tiff image
#       fwidth = imgGeo.getPixelWidth()/1.0
#       fheight = imgGeo.getPixelHeight()/1.0
#       mycsv = Csv.Csv([],fwidth,fheight)
      # get number of colums and rows
#       rows = imgGeo.getNoOfRows()
#       cols = imgGeo.getNoOfCols()
      
#       for r in range(0,rows-1):
#          for c in range(0,cols-1):

#             [x_geo, y_geo] = imgGeo.getGeolocation(c,r)
            # if(x_geo>452189 and x_geo<486362 and y_geo>3858548 and y_geo<3888868):
               # print (r, c, ":")
               # print (x_geo, y_geo)
               # print ("----------------------")
#             classMask  = mask.getPixelValuefromGeo(x_geo,y_geo) 
#             pixelValue = imgGeo.getPixelValue(r,c) # fine 
#             if (imgGeo.isNoValueOrZero(pixelValue)!=1):
               # print ("c_imgGeo of cols,r_imgGeo of rows,x_geo,y_geo,classMask,pixelValue",c, "of", cols,r,"of", rows,x_geo,y_geo,classMask,pixelValue)
#                mycsv.addPixel(classMask,pixelValue)
       

      

      # go to directory for exporting .csvs
#       os.chdir(outCsvDir+"/"+d)

      # export csv file to new directory
#       mycsv.export(img+".csv")
#       print (img+".csv saved")      
#       print ("**********************************************************************")
  
# os.chdir(cdir)

 
print ("   ***   EXIT   ***\n")





