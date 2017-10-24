SET adk_dir="C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Deployment Tools\"
SET adk_env="C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Deployment Tools\DandISetEnv.bat"
SET img_dir=C:\WinPE_amd64
SET iso_file=WinPE.iso

CD %adk_dir%
CALL %adk_env%
MakeWinPEMedia /ISO %img_dir% %img_dir%\%iso_file%