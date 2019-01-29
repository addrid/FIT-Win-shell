cd c:\adw\cv2

for /f "tokens=3" %%i in ('reg query HKCU\Software\ADW /v launches') do (set /a var=%%i)

if not errorlevel 1 goto end
echo CHYBA
reg add HKCU\SOFTWARE\ADW /v launches /t REG_DWORD /d 1 /f

:end
echo OK
set /a var+=1
reg add HKCU\SOFTWARE\ADW /v launches /t REG_DWORD /d %var% /f