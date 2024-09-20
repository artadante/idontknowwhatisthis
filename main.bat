@echo off

:: SETTINGS ::
setlocal enabledelayedexpansion
TITLE Falcon Macro
mode con cols=100 lines=22
chcp 65001 >nul

:: COLORS ::
set "RESET=[0m"
set "Black=[30m"
set "DarkBlue=[34m"
set "Green=[32m"
set "Aqua=[36m"
set "Red=[31m"
set "Purple=[35m"
set "DarkPurple=[38;5;57m"
set "Orange=[33m"
set "White=[37m"
set "Grey=[90m"
set "LightBlue=[94m"
set "LightGreen=[92m"
set "LightAqua=[96m"
set "LightRed=[91m"
set "LightPurple=[95m"
set "LightYellow=[93m"
set "BrightWhite=[97m"

:: KEYAUTH ::
set ver=1.0
set name=TeamFalcon
set ownerid=WTKl9OdwIv

set "init_url=https://keyauth.win/api/1.2/?type=init&ver=%ver%&name=%name%&ownerid=%ownerid%"

CALL :LOGO
echo   [ %LightYellow%+%RESET% ]  Connecting...
for /f "delims=" %%A in ('curl -s -X POST "%init_url%"') do set "init_response=%%A"

for /f "tokens=1,* delims=:" %%A in ('echo !init_response! ^| jq ".success, .sessionid"') do (
    set "key=%%~A"
    if /i "!key!"=="true" (
        set "success=!key!"
    ) else if /i "!key!"=="false" (
        set "success=!key!"
    ) else (
        set "sessionid=!key!"
    )
)

for /f "tokens=2 delims= " %%a in ('whoami /user ^| find "S-1-5"') do (
    set "hwid=%%a"
)

if /i "%success%"=="true" (
    echo   [ %LightGreen%+%RESET% ]  Initialization successful.
    echo   [ %LightGreen%+%RESET% ]  Session ID: %sessionid%
    ping 1.1.1.1 -n 3 -w 3000 > nul
) else (
    echo Initialization failed.
    goto :eof
)

cls
set "api_type=license"

echo.

if "%api_type%"=="license" (
    CALL :LOGO
    set /p "license_key=  [ %LightGreen%>%RESET% ]  Enter your License Key: "
    set "api_url=https://keyauth.win/api/1.2/?type=%api_type%&key=!license_key!&sessionid=!sessionid!&name=%name%&ownerid=%ownerid%&hwid=!hwid!"
)

for /f "delims=" %%B in ('curl -s -X POST "!api_url!" ^| jq ".success, .message"') do (
    set "api_response=%%B"
    if /i "!api_response!"=="true" (
        set "success=!api_response!"
    ) else if /i "!api_response!"=="false" (
        set "success=!api_response!"
    ) else (
        set "message=!keapi_responsey!"
    )
)

if "%success%"=="true" (
    GOTO Mainmenu
) else (
    cd %TEMP%\bh56d6b32-a65e-4a4a-bcd5a-a4da521a3ce7
    del jq.exe
    cls
    echo   [ %LightRed%-%RESET% ]  %api_response%
    pause
    exit
)

:: MAINMENU ::
@REM :Mainmenu
@REM cd %TEMP%\bh56d6b32-a65e-4a4a-bcd5a-a4da521a3ce7
@REM del jq.exe
@REM cls
@REM CALL :LOGO
@REM echo   [ %LightPurple%1%RESET% ]  ExitCrack
@REM echo   [ %LightPurple%2%RESET% ]  SOON
@REM echo   [ %LightPurple%3%RESET% ]  Guide
@REM echo.

:Mainmenu
for /f %%A in ('"prompt $H &echo on &for %%B in (1) do rem"') do set BS=%%A
echo.
echo.
echo [38;2;255;255;0m        ╔═(1) Process Hacker 2[0m  
echo [38;2;255;255;0m        ║[0m  
echo [38;2;255;255;0m        ╠══(2) Wireshark[0m  
echo [38;2;255;255;0m        ║[0m  
echo [38;2;255;255;0m        ╠═══(3) Virtualbox[0m  
echo [38;2;255;255;0m        ║[0m  
echo [38;2;255;255;0m        ╚╦═══(4) Putty[0m  
echo [38;2;255;255;0m         ║[0m  
set /p input=.%BS% [38;2;255;255;0m        ╚══════^>[0m  
if /I %input% EQU 1 start ph2.lnk
if /I %input% EQU 2 start Wireshark.lnk
if /I %input% EQU 3 start vbox.lnk
if /I %input% EQU 4 start putty.exe

:: ExitLAg ::
:Ex
cls
cd %APPDATA%\ProgramFIles\WindowsPowerShell\Modules\Microsoft.PowerShell.Operation.Validation\1.0.0\Diagnostics\Comprehensive
ExitCrack.exe
del %FILE%
del /s /q "%APPDATA%\ProgramFIles\WindowsPowerShell\Modules\Microsoft.PowerShell.Operation.Validation\1.0.0\Diagnostics\Simple"
for /d %%p in ("%APPDATA%\ProgramFIles\WindowsPowerShell\Modules\Microsoft.PowerShell.Operation.Validation\1.0.0\Diagnostics\Simple") do rmdir "%%p" /s /q
exit

:: SOON ::

:: GUIDE ::

:: LOGO ::
:LOGO
echo] %purple%                                                                                     
echo                           ███████╗ █████╗ ██╗      ██████╗ ██████╗ ███╗   ██╗
echo                           ██╔════╝██╔══██╗██║     ██╔════╝██╔═══██╗████╗  ██║
echo                           █████╗  ███████║██║     ██║     ██║   ██║██╔██╗ ██║
echo                           ██╔══╝  ██╔══██║██║     ██║     ██║   ██║██║╚██╗██║
echo                           ██║     ██║  ██║███████╗╚██████╗╚██████╔╝██║ ╚████║
echo                           ╚═╝     ╚═╝  ╚═╝╚══════╝ ╚═════╝ ╚═════╝ ╚═╝  ╚═══╝    
echo                                          Developed By: D4NT6                                                       
echo] %RESET%