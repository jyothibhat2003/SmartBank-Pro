Set-Location (Join-Path (Split-Path -Parent $PSScriptRoot) 'client')
npm start -- --host 127.0.0.1 --port 4200
