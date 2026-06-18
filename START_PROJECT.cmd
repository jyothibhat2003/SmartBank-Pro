@echo off
REM Quick start script for SmartBank-Pro

echo ========================================
echo SmartBank-Pro - Project Starter
echo ========================================
echo.

REM Check if application.properties is configured
findstr /C:"spring.datasource.password=" src\main\resources\application.properties | findstr /V /C:"spring.datasource.password=root" | findstr /V /C:"spring.datasource.password=admin" | findstr /V /C:"spring.datasource.password=password" >nul
if %errorlevel%==0 (
    echo WARNING: MySQL password might not be configured!
    echo Please edit: src\main\resources\application.properties
    echo.
    echo Press any key to continue anyway, or Ctrl+C to exit...
    pause >nul
)

echo Starting Backend Server...
echo Backend will run on: http://localhost:8180
echo.
start "SmartBank Backend" cmd /k "cd /d %~dp0 && mvnw.cmd spring-boot:run"

echo Waiting 5 seconds for backend to initialize...
timeout /t 5 >nul

echo.
echo Starting Frontend Server...
echo Frontend will run on: http://localhost:4200
echo.
start "SmartBank Frontend" cmd /k "cd /d %~dp0\client && npm start"

echo.
echo ========================================
echo Both servers are starting!
echo ========================================
echo.
echo Backend:  http://localhost:8180
echo Frontend: http://localhost:4200
echo.
echo Wait for:
echo - Backend: "Started BankingportalApplication"
echo - Frontend: "Compiled successfully"
echo.
echo Then open: http://localhost:4200
echo.
echo Press any key to close this window...
pause >nul
