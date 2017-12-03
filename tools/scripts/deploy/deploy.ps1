."$scripts\deploy\apply_bcdboot.ps1"
."$scripts\deploy\apply_dism.ps1"
."$scripts\deploy\apply_format_disk.ps1"
."$scripts\deploy\apply_high_power.ps1"
."$scripts\deploy\confirm_apply.ps1"
  #confirm commands that will run before actually
  #applying an image to disk

."$scripts\deploy\select_disk.ps1"
  #prompt user to select connected disk to use

."$scripts\deploy\select_partitioning.ps1"
  #prompt user to select partitioning
  #either UEFI or MBR

."$scripts\deploy\select_wim_source.ps1"
  #select source of wim
  #either local usb or smb netshare

function apply {
  cls
  if($default_use_high_power_scheme) { applyHighPower }
  applyFormatDisk
  applyDISM
  applyBCDBoot
  Write-Host "job complete!"
  pause
}

function deploy {
  if($default_prompt_select_disk) { selectDisk }
  if($default_prompt_select_partitioning) {selectPartitioning }
  if($default_prompt_select_wim_source) { selectWimSource }
  if($default_is_wim_source_netshare) {
    if($default_prompt_select_wim_source_netshare) { selectWimSourceNetshare }
    connectNetshare
    if($default_prompt_pause_after_connecting_netshare) { pause }
  }
  if($gdefault_prompt_select_wim_source_image) { selectWimSourceImage }
  if($default_prompt_confirm_before_apply) { confirm_before_apply }
  else { Write-Host apply }
  if($default_is_wim_source_netshare) { disconnectNetshare }
}