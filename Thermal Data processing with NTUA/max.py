import sys
import numpy as np
from osgeo import gdal

# Set filename
inRaster = sys.argv[1]

################## Read the input Raster #################

inDS = gdal.Open(inRaster, gdal.GA_ReadOnly)

if inDS is None:
  print('Could not open input image '+inRaster)
  sys.exit(1)
  
geoTransform = inDS.GetGeoTransform()
proj = inDS.GetProjection()
rows = inDS.RasterYSize
cols = inDS.RasterXSize
bands_of_srcimg=inDS.RasterCount
#pixelSizeX =  geoTransform[1]
#pixelSizeY = -geoTransform[5]
# read a certain band
inputBand1 = inDS.GetRasterBand(1)
#datatype = inputBand1.DataType
inpim = inputBand1.ReadAsArray(0,0,cols,rows) #read a band's data to be processed

# exclude noData values
vinpim = inpim[inpim != 0.0]

# Find Min and Max values
mn1 = np.amin(vinpim)
mx1 = np.amax(vinpim)

print('%18.15f' % mx1)
