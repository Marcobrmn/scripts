# variables
$RegKey = "ExecutionPolicy"
$RegPath = "Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PowerShell\1\ShellIds\Microsoft.PowerShell"
$getKey = (Get-ItemProperty -Path $RegPath | Select -Exp $RegKey)

# function
try {
  if ($getKey -eq 'Unrestricted') {
    Write-Output "Powershell ExecutionPolicy is Unrestricted";
  } elseif ($getKey -eq 'RemoteSigned') {
    Write-Output "Powershell ExecutionPolicy is RemoteSigned";
  } elseif ($getKey -eq 'AllSigned') {
    Write-Output "Powershell ExecutionPolicy is AllSigned";
  } elseif ($getKey -eq 'Restricted') {
    Write-Output "Powershell ExecutionPolicy is Restricted";
  } elseif ($getKey -eq 'Default') {
    Write-Output "Powershell ExecutionPolicy is Default";
  } elseif ($getKey -eq 'Bypass') {
    Write-Output "Powershell ExecutionPolicy is Bypass";
  } elseif ($getKey -eq 'Undefined') {
    Write-Output "Powershell ExecutionPolicy is Undefined";
  } 
  else {
  Write-Output "Registry Key could not be found";
  }
} catch {
  Write-Output "Issues occured while attempting to detect $Regkey : $($_.Exception.Message)";
}
Read-Host -Prompt “Press Enter to exit”
