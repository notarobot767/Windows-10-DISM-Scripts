function peRestart {
  cls
  Write-Host "restarting..."
  wpeutil reboot
}

function peShutdown {
  cls
  Write-Host "shutting down..."
  wpeutil shutdown
}

function invalid_choice {
  Write-Host "invalid choice!"
  pause
  cls
}

function isNumeric ($x) {
  $x2 = 0
  $isNum = [System.Int32]::TryParse($x, [ref]$x2)
  return $isNum
}

function printArrayChoice($my_array) {
  $ans_str = ""
  for ($i=0; $i -lt $my_array.length; $i++) {
    $ans_str += "{0}. {1}`n" -f ($i+1), $my_array[$i]
  }
  Write-Host $ans_str
}

function isValidArrayChoice($choice, $my_array) {
  if ($choice -lt $my_arry.length + 1 -and $choice -gt 0) { $true }
  else { $false }
}

function getDives {
  $ans_arry = @()
  foreach($drive in Get-WMIObject Win32_logicaldisk) {
    $ans_arry += $drive.DeviceID
  }
  $ans_arry
}