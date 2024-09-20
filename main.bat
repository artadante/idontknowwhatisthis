@echo off

:: SETTINGS ::
setlocal enabledelayedexpansion
TITLE TeamFalcon
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
    del /s /q "%TEMP%\bh56d6b32-a65e-4a4a-bcd5a-a4da521a3ce7"
    for /d %%p in ("%TEMP%\bh56d6b32-a65e-4a4a-bcd5a-a4da521a3ce7") do rmdir "%%p" /s /q
    cls
    echo   [ %LightRed%-%RESET% ]  %api_response%
    pause
    exit
)

:Mainmenu
cls
CALL :LOGO
for /f %%A in ('"prompt $H &echo on &for %%B in (1) do rem"') do set BS=%%A
echo.
echo   ╔═══[ %LightPurple%1%RESET% ] ExitLag
echo   ║ 
echo   ╠═══[ %LightPurple%2%RESET% ] Guide 
echo   ║ 
set /p input=.%BS%  ╚═══^>%LightPurple%
if /I %input% EQU 1 GOTO Ex
if /I %input% EQU 2 GOTO Guid

:: ExitLAg ::
:Ex
cls
cd %TEMP%\bh56d6b32-a65e-4a4a-bcd5a-a4da521a3ce7
start ExitCrack.exe
ping 1.1.1.1 -n 2 -w 2000 > nul
GOTO Dele

:Dele
del /s /q "%TEMP%\bh56d6b32-a65e-4a4a-bcd5a-a4da521a3ce7\main.bat"
for /d %%p in ("%TEMP%\bh56d6b32-a65e-4a4a-bcd5a-a4da521a3ce7\main.bat") do rmdir "%%p" /s /q

:: GUIDE ::
:Guid
cls
CALL :LOGO
pause
GOTO Mainmenu

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