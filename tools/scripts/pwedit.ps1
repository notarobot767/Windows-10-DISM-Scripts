function findSams {
  $ans_str = "found following Windows SAM files:`n"
  $drive_arry = getDives

  if($drive_arry.length -eq 0) { $ans_str += "None`n" }
  else {
    foreach($drive in $drive_arry) {
      $drive = "{0}\Windows\System32\config\SAM" -f $drive
      if(Test-Path $drive) { $ans_str += "{0}`n" -f $drive }
    }
  }
  return $ans_str
}

function pwedit {
  cls
  findSams | Write-Host
  $program = "{0}\ntpwedit64\ntpwedit64.exe" -f $tools
  invoke-expression $program
  pause
}