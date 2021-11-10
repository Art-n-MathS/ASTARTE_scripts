
## @package Csv
#  This class contains Csv file with statistics about a SAR image
#  @author Dr Milto Miltiadou
#  @date Oct 2020
#  @version 1.0

import os
import csv

## finction that takes as input a csv and a list of zones and returns the average backscatterred coefficient with the total noOfPixels
# @param[in] i_filename name of csv file to be imported
# @param[in] i_zones the zones to be extracted from the csv file
# @returns[out] [aveBascatteredCoe,TotalNoOfPixels] 
def getAveBackAndArea(i_filname,i_zones):

   with open(i_filname) as csv_file:
      csv_reader = csv.reader(csv_file, delimiter=',')
      line_count = 0
      totalNoOfPixs=0
      totalCoe=0.0
      for row in csv_reader:
         isZoneSelected=0
         for zone in i_zones:
            if (zone==row[0]):
               isZoneSelected=1
         if (isZoneSelected==0):
            continue
                  
         # row[0]  row[1]      row[2]  row[3]             row[4]    row[5]
         # zone    NoOfPixels  area    backscatterredCoe  PixSizeX  PixSizeZ
         
         noOfPix=float(row[1])/100.0 # normalised to reduced overflow possibilities
         coe=float(row[3])         
         totalCoe=totalCoe+coe*noOfPix
         totalNoOfPixs=totalNoOfPixs+noOfPix
         line_count += 1
            
                       

   if(totalNoOfPixs<=0.001):
      return [0.0,0.0]
   return [totalCoe/totalNoOfPixs,int(totalNoOfPixs*100)]
      

