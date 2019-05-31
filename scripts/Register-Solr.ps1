. .\Common-Functions.ps1

Header -Value "Registering Solr in NSSM"

$Application = "C:\sc9_install\solr-6.6.2\bin\solr.cmd"
$ServiceName = "Solr_6.6.2" 
$ServiceArguments = 'start -f -p 8983'

& nssm install $ServiceName $Application $ServiceArguments
Start-Sleep -Seconds 5

& nssm status $ServiceName
& nssm start $ServiceName
& nssm status $ServiceName

ConsoleWrite -Value "Solr Started!"

ConsoleWrite -Value "Generating SSL Keys"
Set-Location C:\sc9_install\solr-6.6.2\server\etc
cmd /c echo C:\Program Files\Java\jre1.8.0_211\bin\keytool.exe | powershell C:\sc9_install\solrssl.ps1
Set-Location C:\sc9_install\
ConsoleWrite -Value "SSL Keys Generated"

ConsoleWrite -Value "Restarting Solr Service"
Restart-Service "Solr_6.6.2"
ConsoleWrite -Value "Solr service has been re-started"