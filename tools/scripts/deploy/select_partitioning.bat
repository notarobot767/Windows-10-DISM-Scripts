:SelectPartitioning
CLS
ECHO ##############
ECHO #   A. MBR   #
ECHO #   B. GDP   #
ECHO ##############
ECHO.
SET choice=
SET /P choice=select partitioning: 
ECHO.

ECHO select disk %disk% > %diskscript%

IF /I '%choice%'=='A' (
  MORE %scripts%\diskpart\createMBR.bat >> %diskscript%
  ECHO list volume >> %diskscript%
  GOTO FinishParitioning
)
IF /I '%choice%'=='B' (
  MORE %scripts%\diskpart\createUEFI.bat >> %diskscript%
  ECHO list volume >> %diskscript%
  GOTO FinishParitioning
)

ECHO "%choice%" is not valid. Please try again.
PAUSE
GOTO SelectPartitioning

:FinishParitioning