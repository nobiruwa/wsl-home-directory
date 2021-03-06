$Display=":0.0"

# WSLが起動済みの場合に$Displayを上書きする
Get-NetIPAddress | where { $_.InterfaceAlias -like "*WSL*" } | where { $_.AddressFamily -like "IPv4" } | Select-Object -First 1 | foreach { Set-Variable -Name "Display" -Value ($_.IPAddress + ":0.0") }

[Environment]::SetEnvironmentVariable("DISPLAY_BASE", $Display, "User")

[Environment]::SetEnvironmentVariable("DISPLAY", $Display, "User")

# Local Variables:
# coding: utf-16-dos
# End:
