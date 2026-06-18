# PowerShell script to find MySQL password
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "MySQL Password Finder" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

$passwords = @("", "root", "admin", "password", "mysql", "1234", "12345678")
$found = $false

foreach ($pwd in $passwords) {
    if ($pwd -eq "") {
        $displayPwd = "(empty)"
    } else {
        $displayPwd = $pwd
    }
    
    Write-Host "Testing password: $displayPwd" -NoNewline
    
    try {
        # Try to connect using .NET MySQL connector
        Add-Type -Path "C:\Program Files\MySQL\MySQL Server 8.0\Connector NET 8.0\MySql.Data.dll" -ErrorAction SilentlyContinue
        
        $connectionString = "Server=localhost;Port=3306;Uid=root;Pwd=$pwd;SslMode=none;"
        $connection = New-Object MySql.Data.MySqlClient.MySqlConnection
        $connection.ConnectionString = $connectionString
        $connection.Open()
        $connection.Close()
        
        Write-Host " ✓ SUCCESS!" -ForegroundColor Green
        Write-Host ""
        Write-Host "========================================" -ForegroundColor Green
        Write-Host "FOUND IT!" -ForegroundColor Green
        Write-Host "Your MySQL root password is: $displayPwd" -ForegroundColor Yellow
        Write-Host "========================================" -ForegroundColor Green
        Write-Host ""
        Write-Host "Now update this file:" -ForegroundColor Cyan
        Write-Host "  src\main\resources\application.properties"
        Write-Host ""
        Write-Host "Change line 14 to:" -ForegroundColor Cyan
        if ($pwd -eq "") {
            Write-Host "  spring.datasource.password=" -ForegroundColor Yellow
        } else {
            Write-Host "  spring.datasource.password=$pwd" -ForegroundColor Yellow
        }
        Write-Host ""
        
        $found = $true
        break
    }
    catch {
        Write-Host " ✗ Failed" -ForegroundColor Red
    }
}

if (-not $found) {
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Red
    Write-Host "Could not find password automatically" -ForegroundColor Red
    Write-Host "========================================" -ForegroundColor Red
    Write-Host ""
    Write-Host "Please check your MySQL installation or try:" -ForegroundColor Yellow
    Write-Host "1. Open MySQL Workbench and check saved connections"
    Write-Host "2. Try resetting MySQL root password"
    Write-Host "3. Check MySQL installation documentation"
}

Write-Host ""
Write-Host "Press any key to exit..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
