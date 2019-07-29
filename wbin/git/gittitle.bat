@echo off

for %%a in (.) do set currentfolder=%%~na

for /F "tokens=*" %%a in (
    'git symbolic-ref --short HEAD'
) do (
    set CURRENT_BRANCH=%%a
)

title Git [%currentfolder%]: %CURRENT_BRANCH%

