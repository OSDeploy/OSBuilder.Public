#======================================================================================
#   Displays Variables and Prompts for Enter
#   Useful for Debugging
#======================================================================================
Get-Variable | Select-Object -Property Name, Value | Format-Table
[void](Read-Host 'Press Enter to continue')