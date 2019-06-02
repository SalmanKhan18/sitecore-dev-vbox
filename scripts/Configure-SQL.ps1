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
$serverUsername = "sa"
$serverPassword = "Qwerty@12345"
$srvObject = New-Object -TypeName Microsoft.SqlServer.Management.Smo.Server -ArgumentList $server
$srvObject.Logins.Item($serverUsername).ChangePassword($serverPassword)
$srvObject.Logins.Item($serverUsername).Alter()
ConsoleWrite -Value "Changed"
