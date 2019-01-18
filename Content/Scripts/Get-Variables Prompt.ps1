#   David Segura
#   http://osdeploy.com
#
#   OSBuilder Script
#   Get-Variables.ps1
#	Version 19.1.18
#
#   Displays Variables and Prompts for Enter
#   Useful for Debugging
#======================================================================================
Get-Variable | Select-Object -Property Name, Value | Format-Table
[void](Read-Host 'Press Enter to continue')