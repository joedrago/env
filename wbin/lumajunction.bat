@echo off
setlocal

cls

set CAFE_SDK=C:\work\nova_toolchain\sdk\wiiu\cafe\2.12.13

if /%1==/ goto show

echo Updating junction to NRDP %1

cd %CAFE_SDK%\data\disc\content
junction -q -d data
junction data C:\work\nova\build_luma_%1\luma\static\Debug\data

:show

cd %CAFE_SDK%\data\disc\content
echo Current Junction:
junction -s

endlocal
