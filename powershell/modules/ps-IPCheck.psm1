Function ps-IPCheck {
    Param ($IPaddress)
    if (!$IPaddress) {
        $IPaddress = Read-Host "Please enter local IP to check"
    }
    $localIPaddress = (Get-NetIPAddress).ipaddress
    $localIPaddress -contains $IPaddress
}
