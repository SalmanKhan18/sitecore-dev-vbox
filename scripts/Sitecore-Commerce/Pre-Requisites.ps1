Write-Host "Installing Sitecore Commerce Pre-Requisites" -ForegroundColor Green
Write-Host "Installing DotNet Core SDK"
choco install dotnetcore-sdk -y
Write-Host "DotNet Core SDK Installed"

Write-Host "Installing DotNet Core Windows-Hosting"
choco install dotnetcore-windowshosting -y
Write-Host "DotNet Core Windows-Hosting Installed"
