#settings
$azureSDK='C:\Program Files (x86)\Microsoft SDKs\Windows Azure\PowerShell\Azure\'
$subscriptionSettingFileName='credentials.publishsettings'
$slotName='Staging'
$serviceName='test-service'

#power shell setting
Push-Location $azureSDK
Import-Module .\Azure.psd1
Pop-Location
Import-AzurePublishSettingsFile $subscriptionSettingFileName

#waiting ready for web roll
do
{
$deployment = Get-AzureDeployment -ServiceName $serviceName -Slot $slotName
if ($? -ne $true) { exit 1 }
$deployment.RoleInstanceList.InstanceStatus
Start-Sleep -s 10
} while($deployment.RoleInstanceList.InstanceStatus -ne "ReadyRole")
