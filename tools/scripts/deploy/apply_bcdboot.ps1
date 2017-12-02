function getBCDBootMode {
  if($default_is_UEFI) { return "UEFI" } else { return "BIOS" }
}

function getBCDBootCommand {
  $mode = getBCDBootMode
  $ans_str =
    "bcdboot W:\Windows /s {0}: /f {1}" -f
    $default_system_drive, $mode
  return $ans_str
}

function applyBCDBoot { getBCDBootCommand | Invoke-Expression }