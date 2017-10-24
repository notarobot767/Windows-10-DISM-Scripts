@ECHO OFF
SET mount_dir="C:\WinPE_amd64\mount"

Dism /Unmount-Image /MountDir:%mount_dir% /commit