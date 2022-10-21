for /f "tokens=*" %%j in ('dir /b *_NDVI.tif') do call :sub_gdal %%j 
goto :eof 
:sub_gdal 
set str=%1
set str=%str:~0,-9%
set THER=_B10_RS.TIF 
set S_R=_spect_rad.TIF 
set T_k=_temp_kelvin.TIF 
set pv=_Pv.TIF 
set S_V=_NDVI.tif
set T_l=_temp_land.TIF 
set T_c=_temp_celsius.TIF 
set em=_emissivity.TIF 
set str=%str: =%
set THERMAL=%str%%THER%
set SPECT_RAD=%str%_b10%S_R% 
set TEMP_KELVIN=%str%_b10%T_k% 
set CL_NDVI=%str%%S_V% 
set PAR_PV=%str%_b10%pv% 
set EMISSIVITY=%str%_b10%em% 
set TEMP_LAND=%str%_b10%T_l% 
set TEMP_CELSIUM=%str%_b10%T_c% 
call gdal_calc --calc "0.0003342*A+0.1" --format GTiff --type Float32 -A %THERMAL% --A_band 1 --outfile %SPECT_RAD% 
call gdal_calc --calc "1321.0789/(log((774.8853/(1.*A))+1))" --format GTiff --type Float32 -A %SPECT_RAD% --A_band 1 --outfile %TEMP_KELVIN% 
python min.py %CL_NDVI% >tmpFile 
set /p NDVImin= <tmpFile 
echo %NDVImin%
del tmpFile 
python max.py %CL_NDVI% >tmpFile 
set /p NDVImax= <tmpFile 
echo %NDVImax%
del tmpFile 
call gdal_calc --calc "power((((1.*A)-%NDVImin%)/(%NDVImax%-%NDVImin%+0.000000001)),2)" --format GTiff --type Float32 -A %CL_NDVI% --A_band 1 --outfile %PAR_PV% 
call gdal_calc --calc "(0.004*A)+0.986" --format GTiff --type Float32 -A %PAR_PV% --A_band 1 --outfile %EMISSIVITY% 
call gdal_calc --calc "(1.*A)/(1+(((10.9*A)/14387.7738)*log(1.*B)))" --format GTiff --type Float32 -A %TEMP_KELVIN% --A_band 1 -B %EMISSIVITY% --B_band 1 --outfile %TEMP_LAND% 
call gdal_calc --calc "(1.*A)-273.15" --format GTiff --type Float32 -A %TEMP_LAND% --A_band 1 --outfile %TEMP_CELSIUM% 
del *emissivity.TIF *Pv.TIF *temp_land.TIF *temp_kelvin.TIF *spect_rad.TIF
exit/b 

