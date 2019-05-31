. .\Common-Functions.ps1

Header -Value "Configuring SQL"

ConsoleWrite -Value "Enabling Conatined Database Authentication"
Invoke-Sqlcmd -Query "sp_configure 'contained database authentication', 1;
GO 
RECONFIGURE; 
GO"
ConsoleWrite -Value "Enabled!"


Header -Value "Changing SQL Server sa Password"
ConsoleWrite -Value "Change it after the installation is completed"

[System.Reflection.Assembly]::LoadWithPartialName("Microsoft.SqlServer.Smo") | Out-Null
$server = "."
$srvObject = New-Object -TypeName Microsoft.SqlServer.Management.Smo.Server -ArgumentList $server
$srvObject.Logins.Item('sa').ChangePassword("Qwerty@12345")
$srvObject.Logins.Item('sa').Alter()
ConsoleWrite -Value "Changed"
