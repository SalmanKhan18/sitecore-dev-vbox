# Move this the separate script & reference it here.
# Start
function ConsoleWrite {
    Param ([string]$Value)
    
    Write-Output `n$Value
}

function Header {
    Param ([string]$Value)

    Write-Host "[---------------------------$Value---------------------------]" -ForegroundColor Green
}

# End

Header -Value "Enabling Services"

ConsoleWrite -Value "Setting Execution Policy..."
Set-ExecutionPolicy Bypass -Scope Process -Force

ConsoleWrite -Value "Enabling services will take few minutes..."

ConsoleWrite -Value "Enabling IIS. Please Wait..."
Enable-WindowsOptionalFeature -Online -FeatureName IIS-WebServerRole

ConsoleWrite -Value "Enabling ASP Services. Please Wait..."
Add-WindowsFeature -Name "Web-ASP"
Add-WindowsFeature -Name "Web-Asp-Net45"