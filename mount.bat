@ECHO OFF
SET index=1
SET img_file="C:\WinPE_amd64\media\sources\boot.wim"
SET mount_dir="C:\WinPE_amd64\mount"

Dism /Mount-Image /ImageFile:%img_file% /index:%index% /MountDir:%mount_dir%