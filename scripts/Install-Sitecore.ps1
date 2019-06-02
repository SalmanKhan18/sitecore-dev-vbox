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

Header -Value "Executing Final Script"
ConsoleWrite -Value "Installing Sitecore..."
& Set-Location C:\sc9_install
& .\sc9_install_CustomDir.ps1
ConsoleWrite -Value "Sitcore Installed!"
