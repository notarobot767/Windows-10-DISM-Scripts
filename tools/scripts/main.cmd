@ECHO OFF
COLOR F9

SET tools=X:\tools
SET scripts=%tools%\scripts

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
IF /I '%choice%'=='A' GOTO DEPLOY
IF /I '%choice%'=='B' GOTO PWEDIT
IF /I '%choice%'=='Q' GOTO END
IF /I '%choice%'=='R' GOTO REBOOT
IF /I '%choice%'=='S' GOTO SHUTDOWN
ECHO "%choice%" is not valid. Please try again.
PAUSE
GOTO Loop

:DEPLOY
CALL %scripts%\deploy\deploy.bat
GOTO LOOP

:PWEDIT
CALL %scripts%\pwedit.bat
GOTO LOOP

:REBOOT
CLS
ECHO rebooting...
Wpeutil reboot

:SHUTDOWN
CLS
ECHO shutting down...
Wpeutil shutdown

:END
CLS
CMD