
if %Src%=="" goto usage
if %Dst%=="" goto usage
goto start

:usage
echo ------------------------------------------------------------
echo Backup App Specific Data
echo Usage BkApps
echo You must set the Src and Dst variables before calling
echo ------------------------------------------------------------
goto end

:start

REM ------------------------------------------------------------
REM OneNote
REM ------------------------------------------------------------
Set CurSrc="%Src%\AppData\Local\Microsoft\OneNote\16.0\Backup"
Set CurDst=%Dst%\Apps\OneNote
call Sync 

:end




