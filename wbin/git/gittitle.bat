@echo off

for /F "tokens=*" %%a in (
    'git symbolic-ref --short HEAD'
) do (
    set CURRENT_BRANCH=%%a
)

title Git Console: %CURRENT_BRANCH%
