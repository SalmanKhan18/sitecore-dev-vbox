Write-Host "Executing Final Script" -ForegroundColor Green
Write-Host "Installing Sitecore..."
& Set-Location C:\sc9_install
& .\sc9_install_CustomDir.ps1
Write-Host "Sitcore Installed!"