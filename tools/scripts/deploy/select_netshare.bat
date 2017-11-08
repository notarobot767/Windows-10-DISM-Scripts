:SelectNetshare
CLS
SET netshare=%default_netshare%

:: set netshare
SET choice=
SET /P choice=specify network share [%netshare%]: 
IF NOT '%choice%'=='' SET netshare=%choice%
ECHO.
ECHO using network share "%netshare%"
SET choice=
SET /P choice=continue? [y]: 
IF /I '%choice%'=='Y' GOTO ConnectSelectNetshare
GOTO SelectNetshare

:ConnectSelectNetshare
CLS
ECHO connecting to "%netshare%"...
net use n: %netshare%
SET imgdir=N:
SET choice=
SET /P choice=continue? [y]: 
IF /I '%choice%'=='Y' GOTO FinishSelectNetshare
GOTO SelectNetshare

:FinishSelectNetshare