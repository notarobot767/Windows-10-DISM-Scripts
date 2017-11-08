REM UEFI/GPT-based hard drive partitions
REM https://docs.microsoft.com/en-us/windows-hardware/manufacture/desktop/configure-uefigpt-based-hard-drive-partitions

REM Disk will be formatted as follows:
REM [ 1. System ][ 2. MSR ][ 3. Windows ]
REM Recovery tools partition is not necessary

REM S & W are used for convience of avoiding conflict
REM and using this script package when calling Dism and BCDboot
REM Drive letters are reassigned on reboot

REM ###########################################################
REM clean and convert to GUID partition table (GPT)
REM select disk # is passed from deploy.cmd
clean
convert gpt

REM ###########################################################
REM 1. EFI system partition (ESP)
create partition efi size=260
format quick fs=fat32 label="System"
assign letter="S"
REM The minimum size of this partition is 100 MB, and
REM must be formatted using the FAT32 file format
REM Note: for Advanced Format Generation One drives,
REM change to size=260.

REM ###########################################################
REM 2. Microsoft Reserved (MSR) partition
create partition msr size=16
REM Beginning in Windows 10, the size of the MSR is 16 MB

REM ###########################################################
REM 3. Windows partition
create partition primary
format quick fs=ntfs label="Windows"
assign letter="W"
REM W to avoid any assignment conflicts
REM Windows will change it back to C on reboot