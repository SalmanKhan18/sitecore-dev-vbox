$OSInfo = (Get-WmiObject win32_operatingsystem)

Write-Host "Get Basic Information" -ForegroundColor Green

Write-Host "Powershell Version"
(Get-Host).Version.Major

Write-Host  "Operating System"
$OSInfo.name

Write-Host  "System Architecture"
$OSInfo.osarchitecture