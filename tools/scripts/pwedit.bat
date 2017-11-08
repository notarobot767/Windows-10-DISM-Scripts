CLS
ECHO Windows was in drive:
FOR %%i in (C D E F G H I J K) do IF EXIST %%i:\Windows\System32\config\SAM ECHO %%i
CALL %tools%\ntpwedit64\ntpwedit64
PAUSE
GOTO LOOP