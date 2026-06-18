@echo off
REM Script to help find the correct MySQL root password
echo ========================================
echo MySQL Connection Test
echo ========================================
echo.
echo This script will help you find your MySQL root password.
echo We'll test common passwords...
echo.
echo Testing MySQL on localhost:3306...
echo.

REM Test 1: No password
echo [Test 1] Trying: No password (empty)
powershell -Command "$null = New-Object System.Data.Odbc.OdbcConnection('DRIVER={MySQL ODBC 8.0 ANSI Driver};SERVER=localhost;PORT=3306;UID=root;PWD=;'); Write-Host 'SUCCESS: Password is EMPTY' -ForegroundColor Green" 2>nul
if %errorlevel%==0 (
    echo.
    echo ========================================
    echo FOUND IT! Your MySQL password is: ^(empty^)
    echo ========================================
    echo.
    echo Update application.properties line 14:
    echo spring.datasource.password=
    echo.
    pause
    exit /b 0
)

REM Test 2: Password = root
echo [Test 2] Trying: root
powershell -Command "$null = New-Object System.Data.Odbc.OdbcConnection('DRIVER={MySQL ODBC 8.0 ANSI Driver};SERVER=localhost;PORT=3306;UID=root;PWD=root;'); Write-Host 'SUCCESS: Password is root' -ForegroundColor Green" 2>nul
if %errorlevel%==0 (
    echo.
    echo ========================================
    echo FOUND IT! Your MySQL password is: root
    echo ========================================
    echo.
    echo Update application.properties line 14:
    echo spring.datasource.password=root
    echo.
    pause
    exit /b 0
)

REM Test 3: Password = admin
echo [Test 3] Trying: admin
powershell -Command "$null = New-Object System.Data.Odbc.OdbcConnection('DRIVER={MySQL ODBC 8.0 ANSI Driver};SERVER=localhost;PORT=3306;UID=root;PWD=admin;'); Write-Host 'SUCCESS: Password is admin' -ForegroundColor Green" 2>nul
if %errorlevel%==0 (
    echo.
    echo ========================================
    echo FOUND IT! Your MySQL password is: admin
    echo ========================================
    echo.
    echo Update application.properties line 14:
    echo spring.datasource.password=admin
    echo.
    pause
    exit /b 0
)

echo.
echo ========================================
echo Could not find password automatically
echo ========================================
echo.
echo Please try manually:
echo 1. Open MySQL Workbench or command line
echo 2. Try logging in with different passwords
echo 3. Once you find it, update:
echo    src\main\resources\application.properties
echo    Line 14: spring.datasource.password=YOUR_PASSWORD
echo.
echo Common passwords to try:
echo - ^(empty/blank^)
echo - root
echo - admin  
echo - password
echo - Your custom password
echo.
pause
