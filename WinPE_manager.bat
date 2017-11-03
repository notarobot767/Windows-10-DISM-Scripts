::tool to create, mount, commit, build ISO for WinPE

@ECHO OFF
COLOR F9

REM ###############################################################################
::set the image directory
SET img_dir=C:\WinPE_amd64
SET choice=
SET /P choice=enter image directory [%img_dir%]: 
IF NOT '%choice%'=='' SET img_dir=%choice%
ECHO using "%img_dir%" as image directory
PAUSE

REM ###############################################################################
:LOOP
CLS
ECHO #######################################
ECHO #   A. Mount an Image                 #
ECHO #   B. Commit and Unmount an Image    #
ECHO #   C. Discard and Unmount an Image   #
ECHO #   D. Build an ISO                   #
ECHO #   E. Create PE Image                #
ECHO #   Q. Quit                           #
ECHO #######################################
ECHO.

SET choice=
SET /P choice=select option: 
CLS

:: /I makes the IF comparison case-insensitive
IF /I '%choice%'=='A' GOTO MOUNT
IF /I '%choice%'=='B' GOTO COMMIT
IF /I '%choice%'=='C' GOTO DISCARD
IF /I '%choice%'=='D' GOTO ISO
IF /I '%choice%'=='E' GOTO CreatePE
IF /I '%choice%'=='Q' EXIT

ECHO invalid input!
PAUSE
GOTO LOOP

REM ###############################################################################
:MOUNT
:: mount an WinPE enviornment
ECHO loading image and mounting at "%mount_dir"
SET img_file=%img_dir%\media\sources\boot.wim
SET mount_dir=%img_dir%\mount
SET index=1
CALL Dism /Mount-Image /ImageFile:%img_file% /index:%index% /MountDir:%mount_dir%
PAUSE
GOTO LOOP

REM ###############################################################################
:COMMIT
ECHO committing and unmounting...
CALL Dism /Unmount-Image /MountDir:%mount_dir% /commit
PAUSE
GOTO LOOP

REM ###############################################################################
:DISCARD
ECHO discarding and unmounting...
CALL Dism /Unmount-Image /MountDir:%mount_dir% /discard
PAUSE
GOTO LOOP

REM ###############################################################################
:ISO
:: create a bootable ISO of your WinPE enviornment
:: https://docs.microsoft.com/en-us/windows-hardware/manufacture/desktop/winpe-create-usb-bootable-drive
ECHO building ISO...
SET iso_file=WinPE_amd64.iso
CALL MakeWinPEMedia /ISO %img_dir% %img_dir%\%iso_file%
PAUSE
GOTO LOOP

REM ###############################################################################
:CreatePE
SET adk_dir="C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Deployment Tools\"
SET adk_env="C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Deployment Tools\DandISetEnv.bat"
:: where ADK is installed
:: https://docs.microsoft.com/en-us/windows-hardware/get-started/adk-install

CD %adk_dir%
CALL %adk_env%
:: necessary for running copype command

SET ark=amd64
:: define arki
:: Specify either x86, amd64, or arm
:: https://docs.microsoft.com/en-us/windows-hardware/manufacture/desktop/winpe-create-usb-bootable-drive

ECHO creating WinPE image at "%img_dir%"
CALL copype %ark% %img_dir%
:: img_dir should not already exist

PAUSE
GOTO LOOP