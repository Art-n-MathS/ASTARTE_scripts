import gdal
import sys
import numpy as np

inRaster = sys.argv[1]

raster = gdal.Open(inRaster, gdal.GA_ReadOnly)


data = raster.GetRasterBand(1).ReadAsArray().astype('float')
data=data[~np.isnan(data)]
mean = np.mean(data[data <1000]) #calculate mean without value 0
print("%s%s%s" % (inRaster[0:8] , ",",round(mean, 5)))



