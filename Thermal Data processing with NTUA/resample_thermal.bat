for /f "tokens=*" %%j in ('dir /b *_B10.tif') do call :sub_gdal10 %%j 
for /f "tokens=*" %%j in ('dir /b *_B11.tif') do call :sub_gdal11 %%j
goto :eof
 
:sub_gdal10 
set str=%1 
set str=%str:~0,-12% 
set str=%str: =%
set THERIN=%str%_CL_B10.TIF 
set THEROUT=%str%_CL_B10_RS.TIF 
call gdal_translate -outsize 7691 7821 -r nearest -ot Float32 %THERIN% %THEROUT%

:sub_gdal11 
set str=%1 
set str=%str:~0,-12% 
set str=%str: =%
set THERIN=%str%_CL_B11.TIF 
set THEROUT=%str%_CL_B11_RS.TIF 
call gdal_translate -outsize 7691 7821 -r nearest -ot Float32 %THERIN% %THEROUT%

exit/b 
