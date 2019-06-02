Clear-Host

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

$OSInfo = (Get-WmiObject win32_operatingsystem)

Header -Value "Get Basic Information"

ConsoleWrite -Value "Powershell Version"
(Get-Host).Version.Major

ConsoleWrite -Value "Operating System"
$OSInfo.name

ConsoleWrite -Value "System Architecture"
$OSInfo.osarchitecture

ConsoleWrite -Value "SQL Server Version"
Invoke-Sqlcmd -Query "SELECT @@VERSION;" -QueryTimeout 3

ConsoleWrite -Value ".Net Framework Version"
Get-ChildItem 'HKLM:\SOFTWARE\Microsoft\NET Framework Setup\NDP' -recurse |
Get-ItemProperty -Name Version, Release -EA 0 |
where { $_.PSChildName -match '^(?!S)\p{L}' } |
Select PSChildName, Version, Release
