## @package GeoFunctions
#  A set of useful functions that manages GeoImages with Gdal
#  @author Dr Milto Miltiadou
#  @date Oct 2020
#  @version 1.0

import numpy as np
from osgeo import gdal
from gdalconst import *
import ogr
import subprocess

## This functions takes as input two images. It reads the projection and 
#  resolution of the first image and then resamples and reprojects the 
#  2nd image so that they are co-registered
#  @param[in] i_inImg input image for reading projection and resolution
#  @param[in] i_reImg input image to be reprojected and resampled
#  @param[in] name and directory of image to be exported
def reprojsample(i_inImg,i_reImg,i_reNameImg):
   print ("@--------------------------------------------")
   print ("MASK:", i_reImg)
   print ("Image:", i_inImg) 
   inpRInImg = gdal.Open(i_inImg)
   inpRReImg = gdal.Open(i_reImg)
   print ("@--------------------------------------------")
   projInImg = inpRInImg.GetProjection()
   projReImg = inpRReImg.GetProjection()
   print ("++++++ @++ " , projInImg)
   print ("++++++ @++ " , projReImg)


