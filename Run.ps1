Clear

Write-Host "Powershell Version"
(Get-Host).Version.Major

Write-Host "========================"

Write-Host "Operating System"
(Get-WmiObject win32_operatingsystem).name

Write-Host "========================"

Write-Host "Operating Architecture"
(Get-WmiObject win32_operatingsystem).osarchitecture

Write-Host "========================"

Write-Host "SQL Server Version"
Invoke-Sqlcmd -Query "SELECT @@VERSION;" -QueryTimeout 3

Write-Host "========================"

Write-Host ".Net Framework Version"
Get-ChildItem 'HKLM:\SOFTWARE\Microsoft\NET Framework Setup\NDP' -recurse |
Get-ItemProperty -Name Version, Release -EA 0 |
where { $_.PSChildName -match '^(?!S)\p{L}' } |
Select PSChildName, Version, Release

Write-Host "========================"

Write-Host "Setting Execution Policy..."
Set-ExecutionPolicy Bypass -Scope Process -Force

Write-Host "Enabling IIS. Please Wait..."
Enable-WindowsOptionalFeature -Online -FeatureName IIS-WebServerRole

Write-Host "IIS Setup Successfully Completed.!"

Write-Host "========================"
Write-Host "Install Chocolatey"
Set-ExecutionPolicy Bypass -Scope Process -Force;
iex((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

Write-Host "Installed Successful"

Write-Host "========================"

Write-Host "Install Web Deploy"

choco install webdeploy -y

Write-Host "Installed Successful"


Write-Host "========================"

Write-Host "Install URL Rewrite"
choco install urlrewrite  -y

Write-Host "Installed Successful"


Write-Host "========================"

Write-Host "Install Java Runtime Environment"

choco install jre8 -PackageParameters "/exclude:32" -y
Write-Host "Setting JAVA_HOME Path"
& setx -m JAVA_HOME "C:\Program Files\Java\jre1.8.0_211"
Write-Host "Path Set.!"
Write-Host "Installed Successful"


Write-Host "========================"

Write-Host "Install NSSM - Non-Sucking Service Manager"

choco install nssm -y

Write-Host "Installed Successful"

Write-Host "========================"

Write-Host "Create Directory"
New-Item -Path "C:\\sc9_install" -ItemType Directory

Write-Host "Copy Directory to Created Directory"
Copy-Item -Path C:\vagrant\Important\* -Recurse -Destination C:\sc9_install -Container
Write-Host "Copying Done.!"

Write-Host "Changing Directory"
cd C:\sc9_install\
Write-Host "Changed Directory"

Write-Host "========================"
Write-Host "Registering Solr in NSSM"

$Application = "C:\sc9_install\solr-6.6.2\bin\solr.cmd"
$ServiceName = "Solr_6.6.2" 
$ServiceArguments = 'start -f -p 8983'

& nssm install $ServiceName $Application $ServiceArguments
Start-Sleep -Seconds 5

# Should be stopped
& nssm status $ServiceName

# Should be up!
& nssm start $ServiceName

# Should be running
& nssm status $ServiceName

Write-Host "Solr Started..."

Write-Host "========================"
Write-Host "Generated SSL Keys"

Write-Host "Executing Command"
cd C:\sc9_install\solr-6.6.2\server\etc
cmd /c echo C:\Program Files\Java\jre1.8.0_211\bin\keytool.exe | powershell C:\sc9_install\solrssl.ps1
cd C:\sc9_install\
Write-Host "Generated SSL Keys"

Write-Host "========================"

Write-Host "Restarting Solr Service"
Restart-Service "Solr_6.6.2"
Write-Host "Restarting Solr Service Done"

Write-Host "Sitecore Install FrameWork"
Register-PSRepository -Name SitecoreGallery -SourceLocation https://sitecore.myget.org/F/sc-powershell/api/v2 -InstallationPolicy "Trusted"
Install-Module SitecoreInstallFramework -Repository SitecoreGallery -RequiredVersion 1.2.1 -Force | Out-Null
Write-Host "Sitecore Install Framework Completed"

Write-Host "Enable Conatined Database Authentication"
Invoke-Sqlcmd -Query "sp_configure 'contained database authentication', 1;
GO 
RECONFIGURE; 
GO"

Write-Host "Enabled"


Write-Host "Changing the SQL Server sa Password"
[System.Reflection.Assembly]::LoadWithPartialName("Microsoft.SqlServer.Smo") | Out-Null

$server = "."

$srvObject = New-Object -TypeName Microsoft.SqlServer.Management.Smo.Server -ArgumentList $server

$srvObject.Logins.Item('sa').ChangePassword("Qwerty@12345")

$srvObject.Logins.Item('sa').Alter()


Write-Host "Changed"

Write-Host "Enabling ASP Services"
Add-WindowsFeature -Name "Web-ASP"
Add-WindowsFeature -Name "Web-Asp-Net45"
Write-Host "Enabling Services Complete"


Write-Host "Executing Final Script"
& cd C:\sc9_install
& .\sc9_install_CustomDir.ps1
Write-Host "Done"
