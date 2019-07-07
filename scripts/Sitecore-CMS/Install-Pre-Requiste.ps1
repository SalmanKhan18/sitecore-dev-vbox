Write-Host "Installing Pre-Requisites"  -ForegroundColor Green

Write-Host "Installing Chocolatey"
Set-ExecutionPolicy Bypass -Scope Process -Force;
Invoke-Expression((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
Write-Host "Chocolatey Installed"

Write-Host "Installing SQL Server 2017"
choco install sql-server-2017 -y
Write-Host "SQL Server 2017 Installed"

Write-Host "Insatlling SQL Server Management Studio"
choco install sql-server-management-studio --version 14.0.17289.1 -y
Write-Host "SQL Server Management Studio Installed"

Write-host "Installing web deploy"
choco install webdeploy -y
Write-host "web delpoy installed"

Write-host "Installing url rewrite"
choco install urlrewrite  -y
Write-host "url rewrite installed"

Write-host "Installing chrome"
choco install googlechrome -y
Write-host "chrome installed"

Write-host "Installing Notepad++"
choco install notepadplusplus -y
Write-host "chrome installed"

Write-Host "Install Java Runtime Environment"
$javaPath = "C:\Program Files\Java\jre1.8.0_211"
choco install jre8 -PackageParameters "/exclude:32" -y
Write-Host "Setting JAVA_HOME Path"
& setx -m JAVA_HOME $javaPath
Write-Host "JAVA_HOME is set in the System Enviornment Variables.!"
Write-Host "Java Runtime Environment Installed"

Write-Host "Installing NSSM - Non-Sucking Service Manager"
choco install nssm -y
Write-Host "NSSM Installed"

Write-Host "Installing Sitecore FrameWork"
Install-PackageProvider -Name NuGet -Force
Register-PSRepository -Name SitecoreGallery -SourceLocation https://sitecore.myget.org/F/sc-powershell/api/v2 -InstallationPolicy "Trusted"
Install-Module SitecoreInstallFramework -Repository SitecoreGallery -RequiredVersion 1.2.1 -Force | Out-Null
Write-Host "Sitecore Framework Installed"