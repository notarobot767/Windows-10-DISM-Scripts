$tools = "X:\tools"
$scripts = "$tools\scripts"

#import modules
."$scripts\deploy\apply_image.ps1"
."$scripts\deploy\select_disk.ps1"
."$scripts\deploy\select_partitioning.ps1"
."$scripts\deploy\select_wim_source.ps1"
."$scripts\deploy\deploy.ps1"
."$scripts\scripts\networking.ps1"
."$scripts\pwedit.ps1"
."$scripts\pe_system.ps1"
."$scripts\global_vars.ps1"

$default_select_option = "select option"
$default_main_menu_arry =
  "Deploy an Image", #1
  "Password Editor", #2
  "CMD",             #3
  "Restart",         #4
  "Shutdown"         #5

function main {
  $option = $true
  cls
  while($option) {
    #sources (mutable)


    Write-Host "main menu"
    printArrayChoice($default_main_menu_arry)
    $choice = Read-Host $default_select_option
    switch($choice) {
      1 { deploy }
      2 { pwedit }
      3 { $option = $false }
      4 { peRestart }
      5 { peShutdown }
      default { invalid_choice }
    }
    cls
  }
}

main