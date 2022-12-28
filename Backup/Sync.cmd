if %CurSrc%=="" goto usage
if %CurDst%=="" goto usage
goto start

:usage
echo ------------------------------------------------------------
echo Sync two directories
echo Usage Sync
echo You must set the CurSrc and CurDst variables before calling
echo ------------------------------------------------------------
goto end

:start

echo Syncing %CurSrc% to %CurDst%
if exist %CurSrc% (
	mkdir %CurDst%
	robocopy %CurSrc% %CurDst% /MIR /XJ /XF .849C9593-D756-4E56-8D6E-42412F2A707B
)

:end
