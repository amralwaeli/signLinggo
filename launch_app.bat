@echo off
REM === Launch SignLinggo web app for Katalon (auto-frees the port first) ===
cd /d "%~dp0"
echo ============================================================
echo   Freeing port 8090 (stopping stale Dart/Flutter servers)...
taskkill /F /IM dart.exe /T >nul 2>&1
taskkill /F /IM flutter_tester.exe /T >nul 2>&1
timeout /t 2 /nobreak >nul
echo   Starting SignLinggo  ->  http://localhost:8090
echo   KEEP THIS WINDOW OPEN while you run the Katalon tests.
echo ============================================================
where flutter >nul 2>nul
if errorlevel 1 (
  echo [ERROR] Flutter is not on your PATH.
  pause
  exit /b 1
)
call flutter run -d web-server --web-port=8090 --web-hostname=0.0.0.0
pause
