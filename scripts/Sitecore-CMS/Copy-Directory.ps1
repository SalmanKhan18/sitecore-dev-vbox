$path = "C:\\sc9_install"
$remotePath = "C:\vagrant\Important\sc9_install\"

Write-Host "Copying Directory" -ForegroundColor Green

Write-Host "Create Directory"
New-Item -Path $path -ItemType Directory

Write-Host "Copy Sitecore Files to the Created Directory"
Copy-Item -Path $remotePath* -Recurse -Destination $path -Container
Write-Host "Copied!"

Write-Host "Switching Directory"
Set-Location $path

