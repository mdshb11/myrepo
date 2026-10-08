@echo off
setlocal EnableDelayedExpansion
:: Define environment variables
SET "SRC_DIR=H:\cvs\*"
SET "BCKUP_DIR=D:\backupdetails\backup\"
SET "BACKUP_LOG=D:\backupdetails\backup_info.txt"

:: Perform the backup using robocopy
robocopy "%SRC_DIR%" "%BACKUP_DIR%" /MIR /IS /IT /COPYALL /Z /R:3 /W:5
if %ERRORLEVEL% LEQ 7 (
    :: Log success with timestamp
    echo Last backup on %DATE% %TIME% >> "%BACKUP_LOG%"
    echo Backup completed successfully!!!.
    echo ---------- "%BACKUP_LOG%"
) else (
    :: Log failure with timestamp
    echo Backup failed on %DATE% %TIME%. Errorlevel: %ERRORLEVEL%>>"%BACKUP_LOG%"
    echo Error: Backup failed.
    echo ---------- "%BACKUP_LOG%"
    exit /b 1
)
endlocal
pause