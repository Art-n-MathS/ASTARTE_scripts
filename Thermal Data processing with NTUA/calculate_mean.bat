for /f "tokens=*" %%j in ('dir /b *_NDVI.tif') do call :sub_gdal %%j
goto :eof
:sub_gdal
set str=%1
set str=%str:~0,-9%
set str=%str: =%
call gdal_calc --calc "(A*1.0+B*1.0)/2" --format GTiff --type Float32 -A %str%_b10_temp_celsius.tif -B %str%_b11_temp_celsius.tif --outfile %str%_temp_celsius_average.tif
exit/b