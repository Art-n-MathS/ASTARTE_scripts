for /f "tokens=*" %%j in ('dir /b *_B10.tif') do call :sub_ren10 %%j 
goto :eof 
:sub_ren10
set str=%1
set strc=%str%
set str=%str:~17,-22%
set str=%str: =%
set str=%str%B10.TIF
ren %strc% %str%

for /f "tokens=*" %%j in ('dir /b *_B11.tif') do call :sub_ren11 %%j 
goto :eof 
:sub_ren11
set str=%1
set strc=%str%
set str=%str:~17,-22%
set str=%str: =%
set str=%str%B11.TIF
ren %strc% %str%
exit/b