#======================================================================================
#   Set Time Zone to Central Standard Time for WinPE
#======================================================================================
if ($TaskType -eq 'PEBuild') {
    if (Test-Path $MountDirectory) {
        Dism /Image:"$MountDirectory" /Set-TimeZone:"Central Standard Time" /LogPath:"$Logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Dism-SetTimeZone.log"
    }
} else {
    if (Test-Path "$MountWinPE") {
        Dism /Image:"$MountWinPE" /Set-TimeZone:"Central Standard Time" /LogPath:"$PELogs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Dism-SetTimeZone-winpe.wim.log"
    }
    if (Test-Path "$MountSetup") {
        Dism /Image:"$MountSetup" /Set-TimeZone:"Central Standard Time" /LogPath:"$PELogs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Dism-SetTimeZone-setup.wim.log"
    }
    if (Test-Path "$MountWinRE") {
        Dism /Image:"$MountWinRE" /Set-TimeZone:"Central Standard Time" /LogPath:"$PELogs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Dism-SetTimeZone-winre.wim.log"
    }
}
#======================================================================================
#   Testing
#======================================================================================
#   [void](Read-Host 'Press Enter to continue')