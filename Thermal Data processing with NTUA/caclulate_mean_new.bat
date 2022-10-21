del out.csv
for /f "tokens=*" %%j in ('dir /b *_NDVI_M.tif') do call :sub_gdal10 %%j 
goto :eof
 
:sub_gdal10 
set str=%1 

set str=%str:~0,-11% 
set str=%str: =%
set THERIN=%str%NDVI_M.TIF

python getMean.py %THERIN% >>out.csv

echo %THERIN%

exit/b 

/rem gdal_calc -A AOI_masks_based_on_elevation_and_aspect_combined_with_NE_E_SE.tif --outfile mask.tif --calc="(A>50)*1.0" --NoDataValue=0