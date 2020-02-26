color A
@shift /0
setlocal
reg query HKEY_USERS\S-1-5-20 1>nul 2>nul && goto GotPrivileges_1
If "%ElevError%"=="Y" goto Elev_Err_1
set "args="%~f0" %*" & call set "args=%%args:"=\"%%"
echo Initializing...
powershell -c "start cmd -ArgumentList '/c set ElevError=Y& call %args%' -verb runas" && exit /b
mode con cols=100 lines=35
:Elev_Err_1
%ErrLine%
echo Right click on this file and select 'Run as administrator'
goto EXIT

:GotPrivileges_1
endlocal
::========================================================================================================================================


@echo off & goto MainMenu

::========================================================================================================================================
color B
:MainMenu

cls
title GAMELOOP UPDATE NOTFICATION FIX
mode con cols=98 lines=30

echo.
echo.
echo                   _______________________________________________________________
echo                  ^|                                                              ^| 
echo                  ^|      Created by : ペイン六道#3115                              ^|            ^|
echo                  ^|      Support by : gamingforecast.com                         ^|       ^|
echo                  ^|      ___________________________________________________     ^|
echo                  ^|      [A] hosts Enable                                        ^|
echo                  ^|      ___________________________________________________     ^|
echo                  ^|      [F] Exit                                                ^|
echo                  ^|                                                              ^|
echo                  ^|______________________________________________________________^|
echo.          
choice /C:ABCDEF /N /M ".                   Enter Your Choice [A,B,C,D,E,F] : "

if errorlevel  6 goto:EXIT
if errorlevel  1 goto:CHECK
:======================================================================================================================================================

:CHECK
SET hosts=%windir%\system32\drivers\etc\hosts
attrib -r %hosts%
echo. >>%hosts%
FOR %%A IN (

xigncode-solomon-elb-1253180534.ap-northeast-2.elb.amazonaws.com

) DO (
 echo 0.0.0.0 %%A >>%hosts%
)
attrib +r %hosts%
echo Successfully added entries

:EXIT
exit /b