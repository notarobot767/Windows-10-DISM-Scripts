REM UEFI/GPT-based hard drive partitions
REM https://docs.microsoft.com/en-us/windows-hardware/manufacture/desktop/configure-uefigpt-based-hard-drive-partitions

REM Disk will be formatted as follows:
REM [ 1. System ][ 2. MSR ][ 3. Windows ]
REM Recovery tools partition is not necessary

REM ###########################################################
REM clean and convert to GDP
REM select disk # is passed from deploy.cmd
clean
convert gpt

REM ###########################################################
REM 1. System partition (EFI)
create partition efi size=260
format quick fs=fat32 label="System"
assign letter="S"
REM Note: for Advanced Format Generation One drives,
REM change to size=260.

REM ###########################################################
REM 2. Microsoft Reserved (MSR) partition
create partition msr size=128

REM ###########################################################
REM 3. Windows partition
create partition primary
format quick fs=ntfs label="Windows"
assign letter="W"
REM W to avoid any assignment conflicts
REM Windows will change it back to C on reboot

list volume