@echo off
goto :StartxCMDx

Welcome to xCMDx, a clipboard version of CMD
You can easily perform commands, just by copying them! Launch xCMDx and copy the below line to start a calculator:
xCMDx@:start calc

xCMDx has basic security measures, but who likes security? if you want security, then use adminCMD++ (also by SD-Storage)

That's all there is to it, below are some hacks to perform commands without verification

To crash xCMDx:
xCMDx@:echo."&exit

To perform a command without verification:
xCMDx@:"=="" start cmd&echo.|clip&goto :xCMDxScan&echo.

To allow multiple instances of the same command
xCMDx@1:start cmd


:StartxCMDx
if "%~1"=="HackAttempt" goto :HackAttempt
if "%restart%"=="0" (goto xCMDxScan) else (goto :SecurexCMDx)

:xCMDxScan
%extd% /getclipboardtext
(set result|findstr /B /L /I /C:"result=xCMDx@:")>nul 2>&1&&set multipleInstance=no&&call :xCMDx
(set result|findstr /B /L /I /C:"result=xCMDx@1:")>nul 2>&1&&set multipleInstance=yes&&call :xCMDx
goto :xCMDxScan

:xCMDx
if "%result:~7%"=="%xCMDx%" (goto :EOF)
if "%multipleInstance%"=="yes" (set "xCMDx=%result:~8%") else (set "xCMDx=%result:~7%")
%extd% /messageboxcheck "xCMDx" "A command has been received, do you want to execute it?" 4 {xCMDx}
if "%result%"=="7" (call :multipleInstance&goto :EOF) else (call :multipleInstance)
call cmd /c "prompt $GxCMDx$L$S&%xCMDx%"
goto :EOF

:multipleInstance
if "%multipleInstance%"=="yes" (%extd% /setclipboardtext "xCMDx: multiple instances enabled! reset clipboard")
goto :EOF

:HackAttempt
%extd% /messagebox "xCMDx crashed!" "We've just restarted xCMDx because of a hack attempt! please be cautious" 16
exit

:: Crash Helper API from SD-Security
:SecurexCMDx
set restart=0
call cmd /t:f0 /c %0
:CrashHelperPriorityCode
@if errorlevel 999 @exit 999
echo xCMDx Crashed, Restarting...
%extd% /setclipboardtext "xCMDx: Crashed! reset clipboard"
start "" "%~0" HackAttempt
set Restart=1
goto :StartxCMDx
