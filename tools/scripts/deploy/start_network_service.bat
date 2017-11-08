:StartNetworkService
CLS
ECHO starting network service...
wpeutil InitializeNetwork

SET choice=
SET /P choice=continue? [y]:
IF /I '%choice%'=='Y' GOTO FinishStartNetworkService
GOTO StartNetworkService

:FinishStartNetworkService