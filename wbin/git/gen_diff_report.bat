@echo off
REM echo REPORTNAME %REPORTNAME%
REM echo LOCAL %1
REM echo REMOTE  %2
perl %~dp0gen_diff_report.pl %*
