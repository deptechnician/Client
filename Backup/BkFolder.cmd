echo off

REM ---------------------------------------------------------------------
REM  This script will backup a folder from the source to the destination
REM  Note that the arguments passed in must be contained in quotes
REM ---------------------------------------------------------------------

if %1=="" goto usage
if %2=="" goto usage
goto start

:usage
echo ---------------------------------------------
echo Script to backup a folder
echo Usage: BkFolder Source Desitnation
echo Example: BkFolder c:\temp d:\1804\temp
echo ---------------------------------------------
goto end

:start
Set CurSrc=%1
Set CurDst=%2
rem echo Copy %CurSrc% to %CurDst%
Call Sync

:end
