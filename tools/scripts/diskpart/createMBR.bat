REM Sample: Configure BIOS/MBR-Based Hard Disk Partitions
REM  by Using Windows PE and DiskPart
REM https://technet.microsoft.com/en-us/library/hh825677.aspx


REM Disk 0 [ System ][       Windows       ]
select disk 0
clean
convert MBR

REM ###########################################################
REM 1. System partition (MBR)
create partition primary size=350
format quick fs=ntfs label="System"
assign letter="S"

REM ###########################################################
REM 2. Windows partition
create partition primary
format quick fs=ntfs label="Windows"
assign letter="W"
REM W to avoid any assignment conflicts
REM Windows will change it back to C on reboot