@ECHO OFF
COLOR F9

REM SET tools=X:\tools
SET tools=C:\Users\Nrogr\Documents\GitHub\winPE\tools
SET scripts=%tools%\scripts
:LOOP
CLS
ECHO ###########################
ECHO #   A. Deploy an Image    #
ECHO #   B. Capture an Image   #
ECHO #   C. Password Editor    #
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
IF /I '%choice%'=='B' GOTO CAPTURE
IF /I '%choice%'=='C' GOTO PWedit
IF /I '%choice%'=='Q' CALL CMD
IF /I '%choice%'=='R' Wpeutil reboot
IF /I '%choice%'=='S' Wpeutil shutdown
ECHO "%choice%" is not valid. Please try again.
PAUSE
GOTO Loop

:DEPLOY
CLS
CALL %scripts%\dism\deploy.cmd
GOTO END

:CAPTURE
CLS
ECHO capturing image...
PAUSE
GOTO LOOP

:PWedit
CLS
ECHO Windows was in drive:
FOR %%i in (C D E F G H I J K) do IF EXIST %%i:\Windows\System32\config\SAM ECHO %%i
CALL %tools%\ntpwedit64\ntpwedit64
PAUSE
GOTO LOOP

:END
CLS
CMD