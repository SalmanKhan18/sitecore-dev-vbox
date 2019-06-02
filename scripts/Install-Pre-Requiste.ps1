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

Header -Value "Installing Pre-Requisites"

ConsoleWrite -Value "Installing Chocolatey"
Set-ExecutionPolicy Bypass -Scope Process -Force;
Invoke-Expression((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
ConsoleWrite -Value "Chocolatey Installed"

ConsoleWrite -Value "Installing Web Deploy"
choco install webdeploy -y
ConsoleWrite -Value "Web Delpoy Installed"

ConsoleWrite -Value "Installing URL Rewrite"
choco install urlrewrite  -y
ConsoleWrite -Value "Url Rewrite Installed"

ConsoleWrite -Value "Install Java Runtime Environment"
$javaPath = "C:\Program Files\Java\jre1.8.0_211"
choco install jre8 -PackageParameters "/exclude:32" -y
ConsoleWrite -Value "Setting JAVA_HOME Path"
& setx -m JAVA_HOME $javaPath
ConsoleWrite -Value "JAVA_HOME is set in the System Enviornment Variables.!"
ConsoleWrite -Value "Java Runtime Environment Installed"

ConsoleWrite -Value "Installing NSSM - Non-Sucking Service Manager"
choco install nssm -y
ConsoleWrite -Value "NSSM Installed"

ConsoleWrite -Value "Installing Sitecore FrameWork"
Register-PSRepository -Name SitecoreGallery -SourceLocation https://sitecore.myget.org/F/sc-powershell/api/v2 -InstallationPolicy "Trusted"
Install-Module SitecoreInstallFramework -Repository SitecoreGallery -RequiredVersion 1.2.1 -Force | Out-Null
ConsoleWrite -Value "Sitecore Framework Installed"