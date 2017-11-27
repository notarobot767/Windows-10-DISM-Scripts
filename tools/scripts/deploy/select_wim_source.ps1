function selectWimSourceNetshare {
  $prompt = "enter smb netshare address or press enter to select default`n[{0}]" -f
      $default_netshare
  while($true) {
    cls
    $choice = Read-Host $prompt
    if($choice -eq "") { break }
    else {
      cls
      $confirm = "use {0} as the new netshare? [y]" -f
        $default_netshare| Read-Host
      if($confirm.ToLower() -EQ "y") {
        $default_netshare = $choice
        break
      }
    }
  }
}

function selectWimSourceImage {
  cls
  while($true) {
    Write-Host "which wim would you like to use?"
    $wims = Get-ChildItem $default_wim_source | Where-Object {$_.Extension -eq ".wim"}
    $wims_arry = @()
    foreach($wim in $wims) { $wims_arry += $wim}
    if($wims_arry.length -eq 0) {
      cls
      'no wims found at "{0}"' -f $default_wim_source | Write-Host
      pause
      main
    }
    printArrayChoice($wims_arry)
    $choice = Read-Host $default_select_option
    if($choice -lt $wims_arry.length + 1 -and $choice -gt 0) {
      $default_wim_source_image = $wims_arry[$choice-1]
      break
    }
    invalid_choice
  }
}

function selectWimSource {
  cls
  $option = $true
  while($option) {
    $my_array =
      "local usb",        #1
      "smb network share" #2
    Write-Host "what is the source location of your wim file?"
    printArrayChoice($my_array)
    $choice = Read-Host $default_select_option
    $option = $false
    switch($choice) {
      1 { $default_is_wim_source_netshare = $false }
      2 { $default_is_wim_source_netshare = $true }
      default {
        $option = $true
        invalid_choice
      }
    }
  }
}