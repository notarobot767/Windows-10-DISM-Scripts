function get_deploy_commands {
  $dism = getDismApplyCommand
  $bcdboot = getBCDBootCommand
  $msg =
    "powercfg /s $default_power_scheme",
    "diskpart /s $default_diskscript",
    $dism,
    $bcdboot
  $ans_str = ""
  foreach($m in $msg) { $ans_str += "$m`n" }
  return $ans_str
}

function confirm_before_apply {
  $msg = get_deploy_commands
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