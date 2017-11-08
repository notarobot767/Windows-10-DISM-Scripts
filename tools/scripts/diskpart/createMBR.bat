REM BIOS/MBR-based hard drive partitions
REM https://docs.microsoft.com/en-us/windows-hardware/manufacture/desktop/configure-biosmbr-based-hard-drive-partitions

REM Disk will be formatted as follows:
REM [ 1. System ][ 2. Windows ]
REM Recovery tools partition is not necessary

REM S & W are used for convience of avoiding conflict
REM and using this script package when calling Dism and BCDboot
REM Drive letters are reassigned on reboot

REM ###########################################################
REM clean and convert to MBR
REM select disk # is passed from deploy.cmd
clean
convert MBR

REM ###########################################################
REM 1. System partition (MBR)
create partition primary size=100
REM The minimum size of this partition is 100 MB
format quick fs=ntfs label="System"
assign letter="S"
active
REM The system partition must be configured as the active partition

REM ###########################################################
REM 2. Windows partition
create partition primary
format quick fs=ntfs label="Windows"
assign letter="W"