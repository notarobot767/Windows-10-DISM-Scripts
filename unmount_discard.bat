@ECHO OFF
SET adk_dir="C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Deployment Tools"
SET mount_dir="C:\WinPE_amd64\mount"

CD %adk_dir%
Dism /Unmount-Image /MountDir:%mount_dir% /discard
PAUSE