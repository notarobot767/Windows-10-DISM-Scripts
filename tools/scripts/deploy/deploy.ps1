function deploy {
  if($default_prompt_select_disk) { selectDisk }
  if($default_prompt_select_partitioning) {selectPartitioning }
  if($default_prompt_select_wim_source) { selectWimSource }
  if($default_is_wim_source_netshare) {
    if($default_prompt_select_wim_source_netshare) { selectWimSourceNetshare }
    connectNetshare
    if($default_pause_after_connecting_netshare) { pause }
  }
  if($default_prompt_select_wim_source_image) { selectWimSourceImage }
  apply
  if($default_is_wim_source_netshare) { disconnectNetshare }
  Write-Host "job complete!"
  pause
}