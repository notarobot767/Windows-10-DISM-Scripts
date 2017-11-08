:SelectWimSource
CLS
ECHO ########################
ECHO #   L. local usb       #
ECHO #   N. network share   #
ECHO ########################
ECHO.

SET choice=
SET /P choice=select image source: 
IF /I '%choice%'=='L' GOTO SelectLocalImage
IF /I '%choice%'=='N' GOTO SelectNetworkImage
ECHO "%choice%" is not valid. Please try again.
PAUSE
GOTO SelectWimSource

:SelectLocalImage
CALL %scripts%\deploy\select_local_image.bat
GOTO FinishSelectWimSource

:SelectNetworkImage
CALL %scripts%\deploy\start_network_service.bat
CALL %scripts%\deploy\select_netshare.bat
GOTO FinishSelectWimSource

:FinishSelectWimSource