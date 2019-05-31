. .\Common-Functions.ps1

Header -Value "Enabling Services"

ConsoleWrite -Value "Setting Execution Policy..."
Set-ExecutionPolicy Bypass -Scope Process -Force

ConsoleWrite -Value "Enabling services will take few minutes..."

ConsoleWrite -Value "Enabling IIS. Please Wait..."
Enable-WindowsOptionalFeature -Online -FeatureName IIS-WebServerRole

ConsoleWrite -Value "Enabling ASP Services. Please Wait..."
Add-WindowsFeature -Name "Web-ASP"
Add-WindowsFeature -Name "Web-Asp-Net45"