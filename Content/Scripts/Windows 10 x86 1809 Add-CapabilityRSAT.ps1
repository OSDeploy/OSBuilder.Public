#   David Segura
#   http://osdeploy.com
#
#   OSBuilder Script
#   Windows 10 x86 1809 Add-CapabilityRSAT.ps1
#	Version 19.1.23
#   https://docs.microsoft.com/en-us/windows-hardware/manufacture/desktop/features-on-demand-non-language-fod
#======================================================================================
$FODContent = "$OSBuilderContent\IsoExtract\Windows 10 1809 FOD x86"
$CurrentLog = "$Info\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-RSAT.log"

Write-Host "MountDirectory: $MountDirectory" -ForegroundColor DarkGray
Write-Host "FODContent: $FODContent" -ForegroundColor DarkGray
Write-Host "CurrentLog: $CurrentLog" -ForegroundColor DarkGray

$RSAT = @(
    'Rsat.ActiveDirectory.DS-LDS.Tools~~~~0.0.1.0'
    'Rsat.BitLocker.Recovery.Tools~~~~0.0.1.0'
    'Rsat.CertificateServices.Tools~~~~0.0.1.0'
    'Rsat.DHCP.Tools~~~~0.0.1.0'
    'Rsat.Dns.Tools~~~~0.0.1.0'
    'Rsat.FailoverCluster.Management.Tools~~~~0.0.1.0'
    'Rsat.FileServices.Tools~~~~0.0.1.0'
    'Rsat.GroupPolicy.Management.Tools~~~~0.0.1.0'
    'Rsat.IPAM.Client.Tools~~~~0.0.1.0'
    'Rsat.LLDP.Tools~~~~0.0.1.0'
    'Rsat.NetworkController.Tools~~~~0.0.1.0'
    'Rsat.NetworkLoadBalancing.Tools~~~~0.0.1.0'
    'Rsat.RemoteAccess.Management.Tools~~~~0.0.1.0'
    'Rsat.RemoteDesktop.Services.Tools~~~~0.0.1.0'
    'Rsat.ServerManager.Tools~~~~0.0.1.0'
    'Rsat.Shielded.VM.Tools~~~~0.0.1.0'
    'Rsat.StorageReplica.Tools~~~~0.0.1.0'
    'Rsat.VolumeActivation.Tools~~~~0.0.1.0'
    'Rsat.WSUS.Tools~~~~0.0.1.0'
    'Rsat.StorageMigrationService.Management.Tools~~~~0.0.1.0'
    'Rsat.SystemInsights.Management.Tools~~~~0.0.1.0'
)

foreach ($Item in $RSAT) {
    Write-Host "$Item" -ForegroundColor DarkGray
    Add-WindowsCapability -Path "$MountDirectory" -Name "$Item" -Source "$FODContent" -LogPath "$CurrentLog" | Out-Null
}
