#import modules
."X:\tools\scripts\deploy\apply_image.ps1"
."X:\tools\scripts\deploy\select_disk.ps1"
."X:\tools\scripts\deploy\select_partitioning.ps1"
."X:\tools\scripts\deploy\select_wim_source.ps1"
."X:\tools\scripts\deploy\deploy.ps1"
."X:\tools\scripts\networking.ps1"
."X:\tools\scripts\pwedit.ps1"
."X:\tools\scripts\pe_system.ps1"

#immutable means the variables values will not change
#throughout the duration of the script. A mutable variable
#may, however, change if the user is prompted in one of the default
#prompts. Therefore, the mutable variables should be placed into
#the main function loop to be reassigned after a pass

#paths (immutable)
$tools = "X:\tools"
$scripts = "{0}\scripts" -f $tools

#partitioning (immutable)
$default_createUEFI = "{0}\diskpart\createUEFI.bat" -f $scripts
$default_createMBR = "{0}\diskpart\createMBR.bat" -f $scripts
$default_diskscript = "{0}\diskpart\diskscript.bat" -f $scripts
 #diskscript is the dynamic diskpart script built using the
 #default_disk and either the default create UEFI or MBR 

#should the user be prompted for the following or use the defaults? (immutable)
$default_prompt_select_disk = $true
$default_prompt_select_partitioning = $true
$default_prompt_select_wim_source = $true
$default_prompt_select_wim_source_image = $true
$default_prompt_select_wim_source_netshare = $true

#misc (immutable)
$default_power_scheme = "8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c"
  #the high performance power scheme recommended by Microsoft to
  #use when depoying a WIM using DISM (optional speedup)
  #https://docs.microsoft.com/en-us/windows-hardware/manufacture/desktop/winpe-mount-and-customize#highperformance
$default_encoding = "utf8"
  #the default encoding in PS is unicode which does not play
  #nice with some applications when reading script files such as
  #when using the 'diskpart /s [script]' command
$default_dism_index = 1
$default_pause_after_connecting_netshare = $true

#arbitrary drive letters to represent the following (immutable)
$default_netshare_drive_mount = "N"
$default_windows_drive = "W"
$default_system_drive = "S"

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
    $default_wim_source = "N:\"
    $default_wim_source_image = "OG.wim"
    $default_is_wim_source_netshare = $true
    $default_netshare = "\\dropzone\anonymous\wim /user:user pass"
     #even if the netshare is not password protected, Windows
     #may require a bogus user and pw in order to connect

    #partitioning (mutable)
    $default_disk = 0
    $default_is_UEFI = $true

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