for /f "tokens=*" %%j in ('dir /b *_B10.tif') do call :sub_gdal10 %%j 
for /f "tokens=*" %%j in ('dir /b *_B11.tif') do call :sub_gdal11 %%j
goto :eof
 
:sub_gdal10 
set str=%1 
set str=%str:~0,-8% 
set str=%str: =%
set THERIN=%str%B10.TIF 
set THEROUT=%str%B10_RS.TIF 
set NDVI= %str%NDVI.TIF
call gdal_calc -A %NDVI% -B %THERIN% --outfile=%THEROUT% --calc="(A!=0)*B"

:sub_gdal11 
set str=%1 
set str=%str:~0,-8% 
set str=%str: =%
set THERIN=%str%B11.TIF 
set THEROUT=%str%B11_RS.TIF
set NDVI= %str%NDVI.TIF
call gdal_calc -A %NDVI% -B %THERIN% --outfile=%THEROUT% --calc="(A!=0)*B"

exit/b 