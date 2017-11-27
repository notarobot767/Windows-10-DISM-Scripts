function startNetworkService {
    Write-Host "starting network service..."
    wpeutil InitializeNetwork | Write-Host
}

function connectNetshare {
  startNetworkService
  cls
  $wim_source = "{0}:\" -f $default_netshare_drive_mount
  "connecting to {0}`nand mounting as {1}" -f
    $netshare, $default_wim_source | Write-Host
  "net use n: {0}" -f
    $default_netshare | Invoke-Expression | Write-Host
}

function disconnectNetshare {
  Write-Host "`ndisconnecting netshare {0}:" -f
    $default_netshare_drive_mount
  "net use {0}: /delete" -f
    $default_netshare_drive_mount | Invoke-Expression | Write-Host
}