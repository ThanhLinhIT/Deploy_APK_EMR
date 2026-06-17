@echo off
chcp 65001 >nul
title Cap nhat APK - TRIVIET EMR
setlocal

set "FLUTTER_DIR=f:\fluter_t"
set "DEPLOY_DIR=F:\CTY TRÍ VIỆT\Deploy APK"
set "APK_SRC=%FLUTTER_DIR%\build\app\outputs\flutter-apk\app-release.apk"
set "APK_DST=%DEPLOY_DIR%\TRIVIET-EMR.apk"

echo ============================================
echo   CAP NHAT APK - TRIVIET EMR
echo ============================================
echo.

echo [1/3] Build APK release tu Flutter...
cd /d "%FLUTTER_DIR%"
call flutter build apk --release
if errorlevel 1 (
    echo.
    echo [LOI] Build APK that bai. Dung lai.
    pause
    exit /b 1
)

echo.
echo [2/3] Copy APK qua thu muc Deploy...
copy /Y "%APK_SRC%" "%APK_DST%" >nul
if errorlevel 1 (
    echo [LOI] Khong copy duoc APK.
    pause
    exit /b 1
)

echo.
echo [3/3] Push len GitHub...
cd /d "%DEPLOY_DIR%"
git add -A
git commit -m "Cap nhat APK %date% %time%"
git push

echo.
echo ============================================
echo   HOAN TAT!
echo   Link: https://thanhlinhit.github.io/Deploy_APK_EMR/
echo   (Cho ~1 phut de GitHub Pages cap nhat)
echo ============================================
echo.
pause
