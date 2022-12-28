echo off

Set Src=%userprofile%
Set Dst=e:\2212

if exist "ClientSpecificFolders.txt" (
    for /F "delims=;" %%i in (ClientSpecificFolders.txt) do (
        Call BkFolder "%userprofile%\%%i" "%Dst%\%%i"
    )
)

