@echo off
for /F "tokens=2 delims=:" %%i in ('ipconfig ^| findstr /R /C:"192\.168"') do (
    set ip=%%i
)
set ip=%ip: =%
explorer "http://%ip%:8080/smartqueueweb"
