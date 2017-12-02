#arbitrary drive letters to represent the following
$default_netshare_drive_mount = "N"
$default_windows_drive = "W"
$default_system_drive = "S"

#wim source
$default_wim_source = "${default_netshare_drive_mount}:\"
$default_wim_source_image = "OG.wim"
$default_is_wim_source_netshare = $true
$default_netshare = "\\dropzone\anonymous\wim /user:user pass"
 #even if the netshare is not password protected, Windows
 #may require a bogus user and pw in order to connect

#partitioning
$default_disk = 0
$default_is_UEFI = $true
$default_createUEFI = "$scripts\diskpart\createUEFI.bat"
$default_createMBR = "$scripts\diskpart\createMBR.bat"
$default_diskscript = "$scripts\diskpart\diskscript.bat"
 #diskscript is the dynamic diskpart script built using the
 #default_disk and either the default create UEFI or MBR 

#should the user be prompted for the following or use the defaults?
$default_prompt_select_disk = $true
$default_prompt_select_partitioning = $true
$default_prompt_select_wim_source = $true
  #if set false, default_wim_source should be
  #set to "${default_netshare_drive_mount}:\"
$default_prompt_select_wim_source_image = $true
$default_prompt_select_wim_source_netshare = $true
$default_prompt_pause_after_connecting_netshare = $true
$default_prompt_confirm_before_apply = $true

#misc
$default_use_high_power_scheme = $true
$default_power_scheme = "8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c"
  #the high performance power scheme recommended by Microsoft to
  #use when depoying a WIM using DISM (optional speedup)
  #https://docs.microsoft.com/en-us/windows-hardware/manufacture/desktop/winpe-mount-and-customize#highperformance
$default_encoding = "utf8"
  #the default encoding in PS is unicode which does not play
  #nice with some applications when reading script files such as
  #when using the diskpart command
$default_dism_index = 1
  #assumes wim has a index of the this value