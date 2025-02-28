@echo off
echo Please enter the localhost address:
set /p ip=
explorer "http://%ip%:8080/"
pause
