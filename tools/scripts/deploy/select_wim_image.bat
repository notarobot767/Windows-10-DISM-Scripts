:SelectImage
CLS
DIR %imgdir% /b /a-d
ECHO.
SET imgname=
SET /P imgname=type imagename: 
ECHO.

SET choice=
ECHO using image source: %imgdir%\%imgname%
SET /P choice=continue? [y]: 
IF /I '%choice%'=='Y' GOTO FinishSelectImage
GOTO SelectImage

:FinishSelectImage