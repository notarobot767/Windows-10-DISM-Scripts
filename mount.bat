@ECHO OFF
SET adk_dir="C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Deployment Tools"
SET index=1
SET img_file="C:\WinPE_amd64\media\sources\boot.wim"
SET mount_dir="C:\WinPE_amd64\mount"

CD %adk_dir%
Dism /Mount-Image /ImageFile:%img_file% /index:%index% /MountDir:%mount_dir%