Echo off

if "%1"=="" goto usage
goto start

:usage
echo ---------------------------------------------
echo Script to backup a user profile (local files)
echo Usage: BkProfile backuproot
echo Example: BkProfile d:\1804
echo ---------------------------------------------
goto end

:start

Set Src=%userprofile%
Set Dst=%1

pushd .

REM ------------------------------------------------------------
REM Backup the standard folders
REM ------------------------------------------------------------
for %%i in (Documents Desktop Pictures Videos Downloads OneDrive) do (
    Set CurSrc=%Src%\%%i
    Set CurDst=%Dst%\%%i
    Call Sync
)

REM ------------------------------------------------------------
REM Backup the client specific folders
REM ------------------------------------------------------------
if exist "ClientSpecificFolders.txt" (
    for /F "delims=;" %%i in (ClientSpecificFolders.txt) do (
        Call BkFolder "%userprofile%\%%i" "%Dst%\%%i"
    )
)

REM ------------------------------------------------------------
REM Backup the Apps
REM ------------------------------------------------------------
Call BkApps

popd 

:end