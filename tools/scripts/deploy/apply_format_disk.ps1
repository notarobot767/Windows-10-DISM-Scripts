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
  diskpart /s $default_diskscript
}