. .\Common-Functions.ps1

Clear-Host

Header -Value "Get Basic Information"

ConsoleWrite -Value "Powershell Version"
(Get-Host).Version.Major

ConsoleWrite -Value "Operating System"
(Get-WmiObject win32_operatingsystem).name

ConsoleWrite -Value "System Architecture"
(Get-WmiObject win32_operatingsystem).osarchitecture

ConsoleWrite -Value "SQL Server Version"
Invoke-Sqlcmd -Query "SELECT @@VERSION;" -QueryTimeout 3

ConsoleWrite -Value ".Net Framework Version"
Get-ChildItem 'HKLM:\SOFTWARE\Microsoft\NET Framework Setup\NDP' -recurse |
Get-ItemProperty -Name Version, Release -EA 0 |
where { $_.PSChildName -match '^(?!S)\p{L}' } |
Select PSChildName, Version, Release
