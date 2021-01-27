# cd PROTA to directory tis eikones pou theleis na epeksergasteis

# NEW DIRECTORY

# python "G:\Pre-processing\Level1\SENTINEL-1\scripts\printFilesInCurrentDir.py" > "G:\Pre-processing\Level1\SENTINEL-1\scripts\TempList.bat"


# G:\Pre-processing\Level1\SENTINEL-1\05-10-2014 with 02-07-2016\TempList.bat > G:\Pre-processing\Level1\SENTINEL-1\05-10-2014 with 02-07-2016\TempList.out

#Dhmiourgia fakelou ekei pou thes me to onoma pou theleis me ola ta arxeia

# python automated.py -inImgDir "E:/coppied2/Pre-processing/Level0/Sentinel-1/Sentinel-1 Original" -outImgDir "E:/coppied2/Re-processing/Level1/SENTINEL-1"


# import libraries
import os
import FoldersManager
import argparse

# define directory where to be saved
# satelliteDir="E:/ReProcessed/Sentinel1"
# parsing command line inputs
parser = argparse.ArgumentParser()
parser.add_argument("-inImgDir",
     required=True,
     help="Directory of pre-processed GeoTIFF images",
     metavar='<string>')
parser.add_argument("-outImgDir",
     required=True,
     help="Directory of pre-processed GeoTIFF images",
     metavar='<string>')

params       = vars(parser.parse_args())
inImgDir     = params["inImgDir"   ]
outImgDir     = params["outImgDir"   ]

graphDir="E:/Scripts/Dec2020/myGraph.xml"

print ("inImgDir     = ", inImgDir ) 
print ("outImgDir    = ", outImgDir)
dirs=FoldersManager.creatFolders(inImgDir,outImgDir)
os.chdir(inImgDir)
for d in dirs:
   print (d)
   # get a list of images from a given direction
   os.chdir(inImgDir)
   imgs=FoldersManager.getFilesNames(d,".zip")
   for img in imgs:
      imgInDir1 = inImgDir+"/"+d[2:len(d)]+"/"+img
      imgOutDir1 = outImgDir+"/"+d[2:len(d)]+"/"+img
      
      if not os.path.isfile(imgOutDir1 +".dim"):
         print ("gpt \""  + graphDir +"\" -Pin=\""+ imgInDir1 + "\" -Pout=\""+ imgOutDir1 +".dim\"\n")



# gpt C:\Users\milto\Documents\TEPAK\ASTARTE\D3\myGraphSentinel7x7toDIM.xml -Pin="D:\Pre-processing\Level0\Sentinel-1\Sentinel-1 Original\05-02-2019 with 01-01-2020\S1A_IW_GRDH_1SDV_20190205T035116_20190205T035141_025789_02DE41_13F2.zip" -Pout="C:\Users\milto\Documents\TEPAK\ASTARTE\D3\Tests\hello.dim"

# python automated.py -inImgDir "E:\coppied2\Pre-processing\Level0\Sentinel-1" -outImgDir "G:\Level1\Sentinel-1" > "E:\Scripts\Dec2020\covid_noncreatedDims.bat"
