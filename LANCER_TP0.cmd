@echo off
set "PATH=C:\Users\PC\dev\flutter\bin;%PATH%"
cd /d "%~dp0trying_flutter"
call flutter run -d chrome --web-port 7357
