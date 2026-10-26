@echo off
rem ====================================================================
rem BeamNG.Earth - Game and World Server Launcher
rem ====================================================================
setlocal
cd /d "%~dp0"
title BeamNG.Earth Launcher

echo.
echo ====================================================
echo        BeamNG.Earth - Game and World Server
echo ====================================================
echo.

if not exist ".venv\Scripts\python.exe" (
    echo [1/3] Virtual environment not found. Setting up...
    where py >nul 2>nul
    if not errorlevel 1 (
        py -3 install.py --yes
    ) else (
        python install.py --yes
    )
    if not exist ".venv\Scripts\python.exe" (
        echo.
        echo ERROR: Installation failed. Please install Python 3.10+ from https://www.python.org/
        echo and ensure "Add python.exe to PATH" is checked during setup.
        pause
        exit /b 1
    )
)

echo [2/3] Checking server and mod assets...
echo [3/3] Starting world server and BeamNG.drive...
echo.

rem Launch all-in-one launcher
".venv\Scripts\python.exe" launcher.py %*

if errorlevel 1 (
    echo.
    echo [BeamNG.Earth] Process exited with error code %errorlevel%.
    pause
    exit /b %errorlevel%
)

echo.
echo [BeamNG.Earth] Game and server closed.
