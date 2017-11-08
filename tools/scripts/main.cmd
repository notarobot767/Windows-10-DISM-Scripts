@ECHO OFF
COLOR F9

:: #############################################################
:LOOP
CLS
ECHO ###########################
ECHO #   A. Deploy an Image    #
ECHO #   B. Password Editor    #
ECHO #   Q. Command Promt      #
ECHO #   R. Restart            #
ECHO #   S. Shutdown           #
ECHO ###########################
ECHO.

SET choice=
SET /P choice=select option: 
CLS

:: /I makes the IF comparison case-insensitive
IF /I '%choice%'=='A' CALL %scripts%\dism\deploy.cmd
IF /I '%choice%'=='B' CALL %scripts%pwedit.bat
IF /I '%choice%'=='Q' GOTO END
IF /I '%choice%'=='R' GOTO REBOOT
IF /I '%choice%'=='S' GOTO SHUTDOWN
ECHO "%choice%" is not valid. Please try again.
PAUSE
GOTO Loop

:: #############################################################
:REBOOT
CLS
ECHO rebooting...
Wpeutil reboot

:: #############################################################
:SHUTDOWN
CLS
ECHO shutting down...
Wpeutil shutdown

:: #############################################################
:END
CLS
CMD