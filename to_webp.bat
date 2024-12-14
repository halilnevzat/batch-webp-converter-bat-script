@echo off
setlocal enabledelayedexpansion

REM Define quality for webp conversion
set "quality=80"

REM Get the directory of the current script
set "scriptDir=%~dp0"

REM Loop through all jpg, jpeg, and png files in current directory and subdirectories
for /r %%f in (*.jpg *.jpeg *.png) do (
    REM Get the file name without the extension
    set "filename=%%~nf"
    REM Get the directory of the current file
    set "filedir=%%~dpf"
    
    REM Remove trailing backslash from filedir
    set "filedir=!filedir!"

    REM Convert the file to webp using cwebp.exe from the script directory
    echo Converting "%%f" to "!filedir!!filename!.webp"
    "%scriptDir%cwebp.exe" -q %quality% "%%f" -o "!filedir!!filename!.webp"
)

echo Conversion complete!
pause
