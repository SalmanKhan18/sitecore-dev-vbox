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

$path = "C:\\sc9_install"
$remotePath = "C:\vagrant\Important\"

Header -Value "Copying Directory"

ConsoleWrite -Value "Create Directory"
New-Item -Path $path -ItemType Directory

ConsoleWrite -Value "Copy Sitecore Files to the Created Directory"
Copy-Item -Path $remotePath* -Recurse -Destination $path -Container
ConsoleWrite -Value "Copied!"

ConsoleWrite -Value "Switching Directory"
Set-Location $path

