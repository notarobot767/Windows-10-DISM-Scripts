REM BIOS/MBR-based hard drive partitions
REM https://docs.microsoft.com/en-us/windows-hardware/manufacture/desktop/configure-biosmbr-based-hard-drive-partitions

REM Disk will be formatted as follows:
REM [ 1. System ][ 2. Windows ]
REM Recovery tools partition is not necessary

REM ###########################################################
REM clean and convert to MBR
REM select disk # is passed from deploy.cmd
clean
convert MBR

REM ###########################################################
REM 1. System partition (MBR)
create partition primary size=100
REM minimum size of 100MB
format quick fs=ntfs label="System"
assign letter="S"
active

REM ###########################################################
REM 2. Windows partition
create partition primary
format quick fs=ntfs label="Windows"
assign letter="W"
REM W to avoid any assignment conflicts
REM Windows will change it on reboot anyway

list volume