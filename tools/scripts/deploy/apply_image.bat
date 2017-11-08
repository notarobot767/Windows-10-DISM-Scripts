:: Apply Images Using DISM
:: https://docs.microsoft.com/en-us/windows-hardware/manufacture/desktop/apply-images-using-dism

CLS

:: Power Settings
ECHO setting the power scheme to High performance...
powercfg /s 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
:: Optional: speed up the image capture by
:: setting the power scheme to High performance:

:: Format Disk
ECHO formatting disk with Diskpart...
Diskpart /s %diskscript%

:: apply the image with DISM
ECHO applying image with DISM...
Dism /apply-image /imagefile:%imgdir%\%imgname% /index:1 /ApplyDir:W:\

:: BCDBoot
ECHO writing boot config data...
W:\Windows\System32\bcdboot W:\Windows /s S:
:: Configure the system partition by using the BCDBoot tool
:: https://docs.microsoft.com/en-us/windows-hardware/manufacture/desktop/capture-and-apply-windows-system-and-recovery-partitions

ECHO job complete!
PAUSE