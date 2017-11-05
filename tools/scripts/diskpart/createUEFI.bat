:: Sample: Configure UEFI/GPT-Based Hard Drive Partitions
:: by Using Windows PE and DiskPart
:: https://technet.microsoft.com/en-us/library/hh825686.aspx


:: Disk 0 [ System ][   MSR   ][       Windows       ]
select disk %disk%
clean

:: ###########################################################
:: 1. System partition (EFI)
convert gpt
create partition efi size=260
format quick fs=fat32 label="System"
assign letter="S"
:: Note: for Advanced Format Generation One drives,
:: change to size=260.

:: ###########################################################
:: 2. Microsoft Reserved (MSR) partition
create partition msr size=128

:: ###########################################################
:: 3. Windows partition
create partition primary
format quick fs=ntfs label="Windows"
assign letter="W"
:: W to avoid any assignment conflicts
:: Windows will change it back to C on reboot