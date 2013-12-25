#settings.
$azureSDK='C:\Program Files (x86)\Microsoft SDKs\Windows Azure\PowerShell\Azure\'
$subscriptionName=''mysubscription'
$subscriptionSettingFileName='credentials.publishsettings'
$locationName='East US'
$serviceName='testdaservice'
$storageAccountName='testdastorage'
$slotName='Staging'
$appPublishFolder='release'
$cspkgName= 'test.cspkg'
$cscfgName='\ServiceConfiguration.Cloud.cscfg'

#power shell setting
Push-Location $azureSDK
Import-Module .\Azure.psd1
Pop-Location
Import-AzurePublishSettingsFile $subscriptionSettingFileName

#subscription setting
Set-AzureSubscription $subscriptionName -CurrentStorageAccount $storageAccountName
if ($? -ne $true) { exit 1 }

#build file names
Push-Location $appPublishFolder
$currentfolder = Get-Location
$packageName = Join-Path $currentfolder $cspkgName
$configName= Join-Path $currentfolder $cscfgName
PoP-Location

#deploy
New-AzureDeployment -ServiceName $serviceName -Slot $slotName -Package $packageName -Configuration $configName
if ($? -ne $true) { exit 1 }