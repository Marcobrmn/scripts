Function ps-Get-Local-IP {
    Get-NetIPAddress -AddressFamily IPv4 | Sort-Object -Property IPAddress | Format-Table
}
Set-Alias lsip ps-Get-Local-IP
