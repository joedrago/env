@echo off
setlocal
set REPORTNAME=%*
git difftool -d -t report
endlocal
