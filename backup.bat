@echo off
title Simple Folder Backup with Logging
color 0A

:: Configuration - Edit these paths
set SOURCE="H:\car"
set DESTINATION_ROOT="H:\bk"
set BACKUP_NAME="Backup_%date:~-4,4%-%date:~-7,2%-%date:~-10,2%_%time:~0,2%-%time:~3,2%"
set DESTINATION=%DESTINATION_ROOT%\%BACKUP_NAME%
set LOG_FILE="%DESTINATION_ROOT%\Backup_Log.txt"

:: Create destination folder
mkdir %DESTINATION% 2>nul

:: Copy files
echo [%date% %time%] Copying files... >> %LOG_FILE%
robocopy "%SOURCE%" "%DESTINATION_ROOT%" /MIR /Z /R:10 /W:10

:: Check result
if %errorlevel% equ 0 (
    echo [%date% %time%] Backup completed successfully! >> %LOG_FILE%
    echo Backup completed successfully!
) else (
    echo [%date% %time%] Backup failed with error %errorlevel% >> %LOG_FILE%
    echo Backup failed with error %errorlevel%
)

pause