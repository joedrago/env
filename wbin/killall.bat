@echo off
if /%1==/ goto syntax
taskkill /f /im %1.exe
goto end
:syntax
echo killall requires an argument
:end
