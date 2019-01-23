#======================================================================================
#   Set Time Zone to Central Standard Time for WinPE
#======================================================================================
if ($TaskType -eq 'PEBuild') {
    if (Test-Path $MountDirectory) {
        Dism /Image:"$MountDirectory" /Set-TimeZone:"Central Standard Time" /LogPath:"$Logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Dism-SetTimeZone.log"
    }
} else {
    if (Test-Path "$MountWinPE") {
        Dism /Image:"$MountWinPE" /Set-TimeZone:"Central Standard Time" /LogPath:"$PELogs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Dism-SetTimeZone-WinPE.log"
    }
    if (Test-Path "$MountWinRE") {
        Dism /Image:"$MountWinRE" /Set-TimeZone:"Central Standard Time" /LogPath:"$PELogs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Dism-SetTimeZone-WinRE.log"
    }
    if (Test-Path "$MountWinSE") {
        Dism /Image:"$MountWinSE" /Set-TimeZone:"Central Standard Time" /LogPath:"$PELogs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Dism-SetTimeZone-WinSE.log"
    }
}
#======================================================================================
#   Testing
#======================================================================================
#   [void](Read-Host 'Press Enter to continue')
