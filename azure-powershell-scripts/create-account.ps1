#settings
$azureSDK='C:\Program Files (x86)\Microsoft SDKs\Windows Azure\PowerShell\Azure\'
$subscriptionName='my-description'
$subscriptionSettingFileName='credentials.publishsettings'
$locationName='East US'
$serviceName='test-service'
$storageAccountName='test-storage';

#power shell setting
Push-Location $azureSDK
Import-Module .\Azure.psd1
Pop-Location
Import-AzurePublishSettingsFile $subscriptionSettingFileName

#create accounts
New-AzureStorageAccount -StorageAccountName $storageAccountName -Location $locationName
if ($? -ne $true) { exit 1 }
Set-AzureSubscription $subscriptionName -CurrentStorageAccount $storageAccountName
if ($? -ne $true) { exit 1 }
New-AzureService -ServiceName $serviceName -Location $locationName -Label $serviceName
if ($? -ne $true) { exit 1 }
