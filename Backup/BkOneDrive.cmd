if "%1"=="" goto usage
goto start

:usage
echo ---------------------------------------------
echo Script to backup the user's OneDrive
echo Example: BkOneDrive d:\1804
echo ---------------------------------------------
goto end

:start

Set Src=%userprofile%
Set Dst=%1

pushd .

REM ------------------------------------------------------------
REM Backup the standard folders
REM ------------------------------------------------------------
for %%i in (OneDrive) do (
    Set CurSrc=%Src%\%%i
    Set CurDst=%Dst%\%%i
    Call Sync
)

:end