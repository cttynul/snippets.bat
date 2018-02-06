@ECHO off
:: Stupid batch script to restart eth interface
:: I was annoyed with enabling and disabling it from control panel or cmd so i "code" this shit.
:: How to
:: 		- Change, in NETSH command interface name with yours, mine is Ethernet,
::		- If you dont know whats your interface name, run "netsh interface show interface" in cmd as admin
:: Enjoy. - cttynul

GOTO CHECKADMIN

:CORE
netsh interface set interface "Ethernet" admin=disable
netsh interface set interface "Ethernet" admin=enable
ECHO Success!
PAUSE
GOTO EOF

:CHECKADMIN
NET SESSION >nul 2>&1
IF %ERRORLEVEL% == 0 (
	ECHO.
    ECHO Admin permissions confirmed.
    GOTO CORE
) ELSE (
	ECHO Failure: Current permissions inadequate.
	ECHO This script needs to be run as admin. Right click - Run as Admin.
	PAUSE
	GOTO EOF
)
