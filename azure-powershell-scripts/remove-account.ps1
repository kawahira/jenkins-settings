#settings
$azureSDK='C:\Program Files (x86)\Microsoft SDKs\Windows Azure\PowerShell\Azure\'
$subscriptionSettingFileName='credentials.publishsettings'
$serviceName='test-service'
$storageAccountName='test-storage'

#power shell setting
Push-Location $azureSDK
Import-Module .\Azure.psd1
Pop-Location
Import-AzurePublishSettingsFile $subscriptionSettingFileName

#removes
Remove-AzureService -ServiceName $serviceName -Force 
Remove-AzureStorageAccount -StorageAccountName $storageAccountName
