@echo off
set SERVER=192.168.x.x
set SHARE=Backups
set USER=backupuser
set PASS=your_samba_password_here

echo Checking connection to \\%SERVER%\%SHARE% ...

rem Delete any existing connection
net use \\%SERVER%\%SHARE% /delete /yes >nul 2>&1

rem Try to connect with provided credentials
net use \\%SERVER%\%SHARE% /user:%USER% %PASS%

if %ERRORLEVEL% EQU 0 (
    echo ✅ Connection successful!
    echo Listing contents of the share:
    dir \\%SERVER%\%SHARE%
    rem Optional: disconnect after test
    net use \\%SERVER%\%SHARE% /delete /yes >nul 2>&1
) else (
    echo ❌ Connection failed. Please check:
    echo   - Samba is running on the server
    echo   - The user %USER% exists and has access
    echo   - Your firewall isn't blocking SMB
    echo   - SMBv2 or SMBv3 is enabled
)
pause
