@echo off

setlocal

if /%1==/ goto default
set BACK=%1
goto diff
:default
set BACK=1

:diff
echo showing most recent %BACK% commit(s) ...
git --no-pager log HEAD~%BACK%..HEAD
git difftool --dir-diff HEAD~%BACK%

endlocal
