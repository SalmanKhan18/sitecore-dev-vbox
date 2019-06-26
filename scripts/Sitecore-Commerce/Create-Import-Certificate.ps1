Write-Host "Create and Import Certificate" -ForegroundColor Green
Write-Host "Create Certificate storefront.local"
New-SelfSignedCertificate -certstorelocation cert:\localmachine\my -dnsname “storefront.local”
Write-Host "Certificate Created"

Write-Host "Export Certificate To Created Directory"
$Thumbprint = (Get-ChildItem -Path Cert:\LocalMachine\My | Where-Object {$_.Subject -match "storefront.local"}).Thumbprint;
Export-Certificate -Cert cert:\localMachine\my\$Thumbprint -FilePath C:\sc903_com_install\storefront.local.cer
Write-Host "Export Certificate Complete"