Get-NetIPAddress | where { $_.InterfaceAlias -like "*WSL*" } | select { [Environment]::SetEnvironmentVariable("DISPLAY", ($_.IPAddress + ":0.0"), "User") }

# Local Variables:
# coding: utf-16-dos
# End:
