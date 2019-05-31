. .\Common-Functions.ps1

Header -Value "Copying Directory"

ConsoleWrite -Value "Create Directory"
New-Item -Path "C:\\sc9_install" -ItemType Directory

ConsoleWrite -Value "Copy Sitecore Files to the Created Directory"
Copy-Item -Path C:\vagrant\Important\* -Recurse -Destination C:\sc9_install -Container
ConsoleWrite -Value "Copied!"

ConsoleWrite -Value "Switching Directory"
Set-Location "C:\sc9_install\"

