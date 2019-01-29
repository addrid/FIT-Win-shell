@echo off

cd c:\adw\cv2\

set uzivatel="addrid"

tasklist /FI "USERNAME eq %uzivatel%" > procesy.txt

for /f "tokens=1" %%a in (kill.txt) do (for /f "tokens=1,2" %%i in (procesy.txt) do (if %%i==%%a ( taskkill /PID %%j
)
)
)

PAUSE
