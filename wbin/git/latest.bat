@echo off

if /%1==/ goto skip_branch_change

echo [0;33mSwitching to branch: %1[0m
git checkout %1
if %errorlevel% neq 0 goto error

:skip_branch_change

for /F "tokens=*" %%a in (
    'git symbolic-ref --short HEAD'
) do (
    set CURRENT_BRANCH=%%a
)
echo [0;33mDetected branch: [0;35m%CURRENT_BRANCH%[0m

:: Prefix nrdp branch with "nova/"
set CURRENT_BRANCH=nova/%CURRENT_BRANCH%

echo [0;33mRebasing...[0m
git pull --rebase --stat
if %errorlevel% neq 0 goto error
echo [0;33mUpdating submodules...[0m
git submodule update --init
if %errorlevel% neq 0 goto error
pushd nrdp
echo [0;33mChecking out branch [0;35m%CURRENT_BRANCH%[0;33m in nrdp...[0m
git checkout %CURRENT_BRANCH%
git pull --rebase --stat
if %errorlevel% neq 0 goto error
popd

if /%2==/ goto updatetools
goto skiptools

:updatetools

pushd c:\work\nova_tools
echo [0;33mUpdating nova_tools...[0m
git pull --rebase --stat
git submodule update --init
popd

pushd c:\work\nova_toolchain
echo [0;33mUpdating nova_toolchain...[0m
git pull --rebase --stat
git submodule update --init
popd

goto success

:skiptools
echo [0;33mSkipping nova_tools and nova_toolchain pulls (quick mode)[0m

:success
echo [0;33mSuccess![0m
goto end

:error
echo [0;33mError in git command, bailing out[0m
:end

call gittitle.bat
