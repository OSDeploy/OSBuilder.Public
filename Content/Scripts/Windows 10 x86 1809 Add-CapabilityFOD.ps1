#   David Segura
#   http://osdeploy.com
#
#   OSBuilder Script
#   Windows 10 x86 1809 Add-CapabilityFOD.ps1
#   Version 19.1.23
#   https://docs.microsoft.com/en-us/windows-hardware/manufacture/desktop/features-on-demand-non-language-fod
#======================================================================================
$FODContent = "$OSBuilderContent\IsoExtract\Windows 10 1809 FOD x86"
$CurrentLog = "$Info\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-FOD.log"

Write-Host "MountDirectory: $MountDirectory" -ForegroundColor DarkGray
Write-Host "FODContent: $FODContent" -ForegroundColor DarkGray
Write-Host "CurrentLog: $CurrentLog" -ForegroundColor DarkGray

$FOD = @(
    'Microsoft.Onecore.StorageManagement~~~~0.0.1.0'    #Windows Storage Management
    'Microsoft.Windows.StorageManagement~~~~0.0.1.0'    #Windows Storage Management
    'RasCMAK.Client~~~~0.0.1.0'                         #RAS Connection Manager Administration Kit (CMAK)
    'RIP.Listener~~~~0.0.1.0'                           #RIP Listener
    'ServerCore.AppCompatibility~~~~0.0.1.0'            #Server Core App Compatibility
    'SNMP.Client~~~~0.0.1.0'                            #Simple Network Management Protocol
    'WMI-SNMP-Provider.Client~~~~0.0.1.0'               #SNMP WMI Provider
)

foreach ($Item in $FOD) {
    Write-Host "$Item" -ForegroundColor DarkGray
    Add-WindowsCapability -Path "$MountDirectory" -Name "$Item" -Source "$FODContent" -LogPath "$CurrentLog" | Out-Null
}
