:SelectDisk
CLS
Diskpart /s %scripts%\diskpart\list_disk.bat
ECHO.
SET disk=
SET /P disk=select disk number to apply image: 
ECHO.
ECHO using Disk %disk%
SET choice=
SET /P choice=continue? [y/n]: 
IF /I '%choice%'=='Y' GOTO SelectPartition
GOTO SelectDisk
:: find a way to check for valid int