Write-Host "Registering Solr in NSSM" -ForegroundColor Green

$Application = "C:\sc9_install\solr-6.6.2\bin\solr.cmd"
$ServiceName = "Solr_6.6.2" 
$ServiceArguments = 'start -f -p 8983'

& nssm install $ServiceName $Application $ServiceArguments
Start-Sleep -Seconds 5

& nssm status $ServiceName
& nssm start $ServiceName
& nssm status $ServiceName

Write-Host "Solr Started!"

Write-Host "Generating SSL Keys"
Set-Location C:\sc9_install\solr-6.6.2\server\etc
cmd /c echo C:\Program Files\Java\jre1.8.0_211\bin\keytool.exe | powershell C:\sc9_install\solrssl.ps1
Set-Location C:\sc9_install\
Write-Host "SSL Keys Generated"

Write-Host "Restarting Solr Service"
Restart-Service "Solr_6.6.2"
Write-Host "Solr service has been re-started"