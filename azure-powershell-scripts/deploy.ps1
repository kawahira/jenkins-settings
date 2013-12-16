#settings.
$azureSDK='C:\Program Files (x86)\Microsoft SDKs\Windows Azure\PowerShell\Azure\'
$subscriptionName='my-description'
$slotName='Staging'
$locationName='East US'
$storageAccountName='test-storage';
$serviceName='test-service'
$currentfolder = Get-Location
$appPublishFolder='test-service\bin\Release\app.publish'
$cspkgName= 'test.cspkg'
$cscfgName='\ServiceConfiguration.Cloud.cscfg'

#power shell Setting
Push-Location $azureSDK
Import-Module .\Azure.psd1
Pop-Location

#subscription setting
Import-AzurePublishSettingsFile $subscriptionSettingFileName
Set-AzureSubscription $subscriptionName -CurrentStorageAccount $storageAccountName
if ($? -ne $true) { exit 1 }

#deploy
Push-Location $appPublishFolder
$packageName = Join-Path $currentfolder $cspkgName
$configName= Join-Path $currentfolder $cscfgName
PoP-Location

New-AzureDeployment -ServiceName $serviceName -Slot $slotName -Package $packageName -Configuration $configName
if ($? -ne $true) { exit 1 }