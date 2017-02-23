@echo off

for /F "tokens=*" %%a in (
    'git symbolic-ref --short HEAD'
) do (
    set CURRENT_BRANCH=%%a
)
echo [0;33mDetected branch: [0;35m%CURRENT_BRANCH%[0m

echo [0;33mFetching latest info...[0m
git fetch --all
if %errorlevel% neq 0 goto error
echo [0;33mListing available commits from [0;35morigin/%CURRENT_BRANCH%[0m...[0m
git log --oneline ..origin/%CURRENT_BRANCH%
if %errorlevel% neq 0 goto error

goto end

:error
echo [0;33mError in git command, bailing out[0m
:end
echo [0;33mDone![0m
