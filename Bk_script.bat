@echo off
setlocal EnableDelayedExpansion

:: Define environment variables
SET "SRC_DIR=H:\car"
SET "BACKUP_DIR=H:\bk\Backup"
SET "BACKUP_LOG=H:\bk\Backup_info.txt"

:: Check if source directory exists
if not exist "%SRC_DIR%\" (
    echo Error: Source directory "%SRC_DIR%" does not exist.
    exit /b 1
)

:: Create backup directory if it doesn't exist
if not exist "%BACKUP_DIR%\" (
    echo Creating backup directory "%BACKUP_DIR%"...
    mkdir "%BACKUP_DIR%"
    if errorlevel 1 (
        echo Error: Failed to create backup directory "%BACKUP_DIR%".
        exit /b 1
    )
)

:: Perform the backup using robocopy

robocopy "%SRC_DIR%" "%BACKUP_DIR%" /MIR /Z /R:10 /W:10

if %ERRORLEVEL% LEQ 7 (
    :: Log success with timestamp
    echo Backup Completed Successfully. Last Backup On %DATE% %TIME% >>"%BACKUP_LOG%"
    echo -------------------------------------------------------------------- >> "%BACKUP_LOG%"
    echo Backup completed successfully!!!.
    
) else (
    :: Log failure with timestamp
    echo Backup Failed On %DATE% %TIME%. Errorlevel: %ERRORLEVEL% >>"%BACKUP_LOG%"
    echo -------------------------------------------------------------------- >> "%BACKUP_LOG%"
    echo Error: Backup Failed.
    exit /b 1
)
endlocal
pause