Function ps-Check-Prefix {
    Param ($prefix)
    if (!$prefix) {
        $prefix = Read-Host "Please enter Network to check (e.g. "192.168.")"
    }
    
    if (Get-NetIPAddress -AddressFamily IPv4 | Where-Object { $_.IPAddress -match $prefix}) {
        write-host "Network prefix matches" -ForegroundColor DarkGreen
        Get-NetIPAddress -AddressFamily IPv4 | Select-Object IPAddress, PrefixOrigin | Where-Object { $_.IPAddress -match $prefix}
    }else {
        $title    = write-host "Network prefix does not match" -ForegroundColor Red
        $question = 'Do you want to see all local IP addresses?'
        $choices  = '&Yes', '&No'

        $decision = $Host.UI.PromptForChoice($title, $question, $choices, 1)
        if ($decision -eq 0) {
            Get-NetIPAddress -AddressFamily IPv4 | Select-Object IPAddress, PrefixOrigin | Sort-Object IPAddress | Format-Table
        }else {
            exit 0
        }
    }
}
