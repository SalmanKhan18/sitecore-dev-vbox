Write-Host  "Enabling Services" -ForegroundColor Green

Write-Host  "Setting Execution Policy..."
Set-ExecutionPolicy Bypass -Scope Process -Force

Write-Host  "Enabling services will take few minutes..."

Write-Host  "Enabling IIS. Please Wait..."
Enable-WindowsOptionalFeature -Online -FeatureName IIS-WebServerRole

Write-Host  "Enabling ASP Services. Please Wait..."
Add-WindowsFeature -Name "Web-ASP"
Add-WindowsFeature -Name "Web-Asp-Net45"

