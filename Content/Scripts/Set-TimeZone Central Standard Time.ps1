#======================================================================================
#   Set Time Zone to Central Standard Time for Install.wim
#======================================================================================
if (Test-Path $MountDirectory) {
    Dism /Image:"$MountDirectory" /Set-TimeZone:"Central Standard Time" /LogPath:"$Logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Dism-SetTimeZone.log"
}
#======================================================================================
#   Testing
#======================================================================================
#   [void](Read-Host 'Press Enter to continue')