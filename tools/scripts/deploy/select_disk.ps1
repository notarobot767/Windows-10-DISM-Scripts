function selectDisk {
  while($true) {
    $ans_str = "which disk do you want to format?`n"
    cls
    $disk_arry = @()
    $i = 1
    foreach($disk in Get-Disk) {
      $disk_arry += $disk.number
      $ans_str += "{0}. Disk {1}: {2}`n" -f 
        $i, $disk.number, $disk.friendlyname
      $i++
    }
    Write-Host $ans_str
    $choice = Read-Host $default_select_option
    
    if ($choice -lt $disk_arry.length + 1 -AND $choice -gt 0) {
      $default_disk = $disk_arry[$choice-1]
      break
    }
    else { invalid_choice }
  }
}