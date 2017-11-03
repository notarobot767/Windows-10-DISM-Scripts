::tool to create, mount, commit, build ISO for WinPE

@ECHO OFF
COLOR F9

:: where ADK is installed
:: https://docs.microsoft.com/en-us/windows-hardware/get-started/adk-install
SET adk_dir="C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Deployment Tools\"
SET adk_env="C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Deployment Tools\DandISetEnv.bat"
CD %adk_dir%
CALL %adk_env%

::set the image directory
SET img_dir=C:\WinPE_amd64
SET choice=
SET /P choice=enter image directory [%img_dir%]: 
IF NOT '%choice%'=='' img_dir=%choice%
ECHO using "%img_dir%" as image directory
PAUSE

:LOOP
CLS
ECHO #######################################
ECHO #   A. Mount an Image                 #
ECHO #   B. Commit and Unmount an Image    #
ECHO #   C. Discard and Unmount an Image   #
ECHO #   D. Build an ISO                   #
ECHO #   E. Create PE Drive                #
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
IF /I '%choice%'=='E' GOTO CreatePEDrive
IF /I '%choice%'=='Q' EXIT

ECHO invalid input!
PAUSE
GOTO LOOP

:MOUNT
ECHO loading image and mounting at "%mount_dir"
SET img_file=%img_dir%\media\sources\boot.wim
SET mount_dir=%img_dir%\mount
SET index=1
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
SET iso_file=WinPE_amd64.iso
CALL MakeWinPEMedia /ISO %img_dir% %img_dir%\%iso_file%
PAUSE
GOTO LOOP

:CreatePEDrive
SET ark=amd64
ECHO creating WinPE drive at "%img_dir%"
CALL copype %ark% C:\WinPE_amd64
PAUSE
GOTO LOOP