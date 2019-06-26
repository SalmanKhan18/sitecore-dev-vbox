Write-Host "Configuring SQL" -ForegroundColor Green

$serverInstance = $env:COMPUTERNAME + '\SQLEXPRESS'

Write-Host "Enabling Conatined Database Authentication"
Invoke-Sqlcmd -ServerInstance $serverInstance -Query "sp_configure 'contained database authentication', 1;
GO 
RECONFIGURE; 
GO"
Write-Host "Enabled!"

Write-Host "Changing SQL Server sa Password" -ForegroundColor Green
Write-Host "Change it after the installation is completed"

Invoke-Sqlcmd -ServerInstance $serverInstance -Query "USE [master]
GO
ALTER LOGIN [sa] WITH PASSWORD='Qwerty@12345'
GO
ALTER LOGIN [sa] ENABLE
GO"
Write-Host "Changed"

Write-Host "Changing to Mixed Mode"
Invoke-Sqlcmd -ServerInstance $serverInstance -Query "USE [master]
GO
EXEC xp_instance_regwrite N'HKEY_LOCAL_MACHINE', N'Software\Microsoft\MSSQLServer\MSSQLServer', N'LoginMode', REG_DWORD, 2
GO"
Write-Host "Changing to Mixed Mode Complete"

Write-Host "Restarting SQL Server"
Restart-Service -Name 'MSSQL$SQLEXPRESS' -Force
Write-Host "Restarting SQL Server Complete"