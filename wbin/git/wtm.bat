@echo off
REM Who To Merge?
setlocal

set WHO=%*
if "%WHO%"=="" set WHO=release

REM echo WhoToMerge [%WHO%]:
git branch --remote --no-merged | grep %WHO%

endlocal
