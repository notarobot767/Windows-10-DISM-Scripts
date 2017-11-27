@ECHO OFF
TITLE ghost snakes
ECHO initializing...
wpeinit
powershell Set-ExecutionPolicy RemoteSigned
START /MAX Powershell X:\tools\scripts\main.ps1
CLS

:: Put me in X:\Windows\System32\