@ECHO OFF
COLOR F9

SET adk_dir="C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Deployment Tools\"
SET adk_env="C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Deployment Tools\DandISetEnv.bat"
SET mount_dir=C:\WinPE_amd64\mount
SET img_dir=C:\WinPE_amd64
SET img_file=C:\WinPE_amd64\media\sources\boot.wim
SET iso_file=WinPE.iso
SET index=1

CD %adk_dir%
CALL %adk_env%

:LOOP
CLS
ECHO #######################################
ECHO #   A. Mount an Image                 #
ECHO #   B. Commit and Unmount an Image    #
ECHO #   C. Discard and Unmount an Image   #
ECHO #   D. Build an ISO                   #
ECHO #######################################
ECHO.

SET choice=
SET /P choice=select option: 
CLS

IF /I '%choice%'=='A' GOTO MOUNT
IF /I '%choice%'=='B' GOTO COMMIT
IF /I '%choice%'=='C' GOTO DISCARD
IF /I '%choice%'=='D' GOTO ISO

ECHO invalid input!
PAUSE
GOTO LOOP

:MOUNT
ECHO mounting...
CALL Dism /Mount-Image /ImageFile:%img_file% /index:%index% /MountDir:%mount_dir%
PAUSE
GOTO LOOP

:COMMIT
ECHO committing and unmounting...
CALL Dism /Unmount-Image /MountDir:%mount_dir% /commit
PAUSE
GOTO LOOP

:DISCARD
ECHO discarding and unmounting...
CALL Dism /Unmount-Image /MountDir:%mount_dir% /discard
PAUSE
GOTO LOOP

:ISO
ECHO building ISO...
CALL MakeWinPEMedia /ISO %img_dir% %img_dir%\%iso_file%
PAUSE
GOTO LOOP