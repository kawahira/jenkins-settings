#settings
$azureSDK='C:\Program Files (x86)\Microsoft SDKs\Windows Azure\PowerShell\Azure\'
$subscriptionName='mydescription'
$subscriptionSettingFileName='credentials.publishsettings'
$locationName='East US'
$serviceName='testdaservice'
$storageAccountName='testdastorage'
$pfxName = 'mycertificate.pfx'
$password = 'password123'

#power shell setting
Push-Location $azureSDK
Import-Module .\Azure.psd1
Pop-Location
Import-AzurePublishSettingsFile $subscriptionSettingFileName
Add-AzureCertificate -serviceName $serviceName -certToDeploy $pfxName -password $password

