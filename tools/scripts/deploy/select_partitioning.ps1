function selectPartitioning {
  cls
  while($true) {
    $my_array =
      "GDP", #1
      "MBR"  #2
      
    Write-Host "what kind of partitioning table do you want?"
    printArrayChoice($my_array)
    $choice = Read-Host $default_select_option
    
    if($choice -eq 1) { $default_is_UEFI = $true; break }
    else {
      if($choice -eq 2) { $default_is_UEFI = $false; break }
      else { invalid_choice }
    }
  }
}