Write-Host "Copying Directory" -ForegroundColor Green
$path = "C:\\sc903_com_install"
$remotePath = "C:\vagrant\Important\sc903_com_install\"
Write-Host "Create Directory"
New-Item -Path $path -ItemType Directory

Write-Host "Copy Sitecore Files to the Created Directory"
Copy-Item -Path $remotePath* -Recurse -Destination $path -Container
Write-Host "Copied!"

Write-Host "Switching Directory"
Set-Location $path