. .\Common-Functions.ps1

Header -Value "Executing Final Script"
ConsoleWrite -Value "Installing Sitecore..."
& Set-Location C:\sc9_install
& .\sc9_install_CustomDir.ps1
ConsoleWrite -Value "Sitcore Installed!"
