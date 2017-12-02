function get_deploy_commands {
  $wim_source = "$default_wim_source$default_wim_source_image"
  $dism = "dism /apply-image /imagefile:{0} /index:{1} /applydir:{2}:\" -f
    $default_wim_source, $default_dism_index, $default_windows_drive
  $mode = if($default_is_UEFI) { "UEFI" } else { "BIOS" }
  $bcdboot = "bcdboot W:\Windows /s {0}: /f {1}" -f
    $default_system_drive, $mode
  
  $msg =
    "powercfg /s $default_power_scheme",
    "diskpart /s $default_diskscript",
    $dism,
    $bcdboot
  $ans_str = ""
  foreach($m in $msg) { $ans_str += "${m}`n" }
  return $ans_str
}

function confirm_before_apply {
  $my_arry = get_deploy_commands
  while($true) {
    cls
    $choice = Read-Host "about to run the following`n`n$msg`ncontinue?[y/n]..."
    switch($choice.ToLower()) {
      "y" {
        apply
        return $true
      }
      "n" {
        return $true
      }
      default {
        invalid_choice
      }
    }
  }
}