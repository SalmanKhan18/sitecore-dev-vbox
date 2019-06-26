Wirte-Host "Install Sitecore Commerce" -ForegroundColor Green
& iisreset

Set-Location C:\sc903_com_install\SIF\
& .\sc903_com_install.ps1
Wirte-Host "Sitecore Commerce Installed"