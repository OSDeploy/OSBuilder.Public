#   David Segura
#   http://osdeploy.com
#
#   OSBuilder Script
#   Global Remove-4kWallpaper.ps1
#   Version 19.1.22
#
#   Removes 4K Wallpaper
#======================================================================================
#   Remove 4K Wallpaper
#======================================================================================
if (Test-Path "$MountDirectory\Windows\Web\4K\Wallpaper\Windows") {
    takeown /f "$MountDirectory\Windows\Web\4K\Wallpaper\Windows\*"
    & icacls "$MountDirectory\Windows\Web\4K\Wallpaper\Windows\*.*" /grant "Administrators:(F)"
    Remove-Item -Path "$MountDirectory\Windows\Web\4K\Wallpaper\Windows\*" -Force
}

#======================================================================================
#   Testing
#======================================================================================
#   [void](Read-Host 'Press Enter to continue')
