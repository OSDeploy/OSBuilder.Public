#   David Segura
#   http://osdeploy.com
#
#   OSBuilder Script
#   Windows 10 x64 Update-OneDriveSetup.ps1
#   Version 19.1.23
#======================================================================================
#   Download Latest OneDriveSetup
#======================================================================================
$OneDriveURL = 'https://go.microsoft.com/fwlink/p/?LinkId=248256'
$OneDriveDir = "$OSBuilderContent\Scripts\OneDrive"
$OneDriveFileName = 'OneDriveSetup.exe'

if (!(Test-Path "$OneDriveDir")) {New-Item -Path $OneDriveDir -ItemType Directory -Force | Out-Null}

Start-BitsTransfer -Source $OneDriveURL -Destination "$OneDriveDir\$OneDriveFileName"

#======================================================================================
#   Copy OneDriveSetup.exe
#======================================================================================
robocopy "$OneDriveDir" "$MountDirectory\Windows\SysWOW64" OneDriveSetup.exe /ndl /nfl /xx /b /np /ts /tee /r:0 /w:0

#======================================================================================
#   Testing
#======================================================================================
#   [void](Read-Host 'Press Enter to continue')