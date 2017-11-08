:: defaults
SET default_netshare=\\dropzone\anonymous\wim /user:user pass
SET diskscript=%scripts%\diskpart\diskscript.bat
:: diskscript is dynamically created based on
::   a. selected disk
::   b. MBR or GDP

:: SelectDisk
CALL %scripts%\deploy\select_disk.bat

:: SelectPartitioning
CALL %scripts%\deploy\select_partitioning.bat

:: SelectWimSource
CALL %scripts%\deploy\select_wim_source.bat

:: SelectWimImage
CALL %scripts%\deploy\select_wim_image.bat

:: ApplyImage
CALL %scripts%\deploy\apply_image.bat