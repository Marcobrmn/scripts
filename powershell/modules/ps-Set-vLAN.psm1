Function ps-Set-vLAN {
    Param ($vlan)
    if (!$vlan) {
        $vlan = Read-Host "Please enter vLAN ID:"
    }
    Set-VMnetworkadapterVlan -ManagementOS -VMnetworkAdapterName vLAN -access -vlanid $vlan
}
Set-Alias setvlan ps-Set-vLAN
