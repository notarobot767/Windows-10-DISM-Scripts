function getDismWimImagePath {
  return "$default_wim_source$default_wim_source_image"
}

function getDismApplyCommand {
  $wim_source = getDismWimImagePath
  $ans_str =
    "dism /apply-image /imagefile:{0} /index:{1} /applydir:{2}:\" -f
    $wim_source, $default_dism_index, $default_windows_drive
  return $ans_str
}

function applyDISM {
  Write-Host "`napplying image '$default_wim_source_image' with DISM..."
  $getDismApplyCommand | Invoke-Expression
}