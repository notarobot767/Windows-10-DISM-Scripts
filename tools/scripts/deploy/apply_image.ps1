function applyHighPower {
  Write-Host "setting power scheme to High performance..."
  powercfg /s $default_power_scheme | Write-Host
}

function applyWriteDiskScript {
  "select disk {0}" -f $default_disk |
    Out-File $default_diskscript -Force -Encoding $default_encoding
  
  $partitioning =
    if($default_is_UEFI) { $default_createUEFI }
    else { $default_createMBR }  
  
  cat $partitioning |
    Out-File $default_diskscript -Append -Encoding $default_encoding
}

function applyFormatDisk {
  Write-Host "`nformatting the disk with Diskpart..."
  applyWriteDiskScript
  diskpart /s $default_diskscript | Write-Host
}

function applyDISM {
  Write-Host "`napplying the image with DISM..."
  "dism /apply-image /imagefile:{0} /index:{1} /applydir:{2}:\" -f
    $deploy_wim_source, $default_dism_index, $default_windows_drive |
    Invoke-Expression | Write-Host
}

function applyBCDBoot {
  Write-Host "`nwriting boot files with BCDBoot to system partition..."
  $mode = if($default_is_UEFI) { "UEFI" } else { "BIOS" }
  "bcdboot W:\Windows /s {0}: /f {1}" -f
    $default_system_drive, $mode | Invoke-Expression | Write-Host
}

function apply {
  cls
  applyHighPower
  applyFormatDisk
  applyDISM
  applyBCDBoot
  disconnectNetshare
}