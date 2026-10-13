@echo off
title Blue Ridge Parkway - Initial Deploy to GitHub Pages
cd /d "%~dp0"

echo ======================================================================
echo    BLUE RIDGE PARKWAY EXPEDITION: DEPLOY TO GITHUB PAGES
echo    Account: Rindelk  ^|  Repository: blue-ridge-parkway
echo ======================================================================
echo.

:: 1. Check if git is initialized
if not exist ".git" (
    echo [*] Initializing local Git repository (main branch)...
    git init -b main
    echo [*] Setting author identity...
    git config user.name "Rindelk"
    git config user.email "Rindelk@users.noreply.github.com"
    echo [*] Adding remote origin: https://github.com/Rindelk/blue-ridge-parkway.git...
    git remote add origin https://github.com/Rindelk/blue-ridge-parkway.git
) else (
    echo [OK] Git repository already initialized.
    git remote remove origin >nul 2>&1
    git remote add origin https://github.com/Rindelk/blue-ridge-parkway.git
)

:: 2. Stage all assets
echo [*] Staging all project files and navigation assets...
git add .

:: 3. Commit
echo [*] Creating initial release commit...
git commit -m "Initial Release: Blue Ridge Parkway & Appalachian Twisties Master Package"

:: 4. Push to GitHub
echo.
echo ======================================================================
echo [*] Pushing files to https://github.com/Rindelk/blue-ridge-parkway...
echo ======================================================================
echo.
git push -u origin main

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ======================================================================
    echo  [SUCCESS] INITIAL PUSH COMPLETE!
    echo ======================================================================
    echo.
    echo  Final Step: Enable GitHub Pages in your repository settings:
    echo  1. Open: https://github.com/Rindelk/blue-ridge-parkway/settings/pages
    echo  2. Under 'Build and deployment' -^> 'Source', select: 'Deploy from a branch'
    echo  3. Under 'Branch', select 'main' and '/(root)'
    echo  4. Click 'Save'
    echo.
    echo  Within ~45 seconds, your live interactive tour will be online at:
    echo  --^> https://rindelk.github.io/blue-ridge-parkway/
    echo ======================================================================
) else (
    echo.
    echo [!] Push failed or was cancelled. Check your network or GitHub login.
)

echo.
pause
