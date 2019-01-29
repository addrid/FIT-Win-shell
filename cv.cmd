cd c:\
IF EXIST c:\total.txt (
    for /f "tokens=1,2,3" %%i IN (c:\total.txt) do (set /a "ok=%%i" & set /a "fail=%%j" & set /a "lastFails=%%k")
) ELSE ( 
    set /a ok=0
    set /a fail=0
    set /a lastFails=0
)

ping www.fit.cvut.cz -n 1 -w 1 | find /i "TTL"

if errorlevel 1 goto fail
echo %date%;%time:~0,8%;OK >> log.csv
set /a ok+=1
echo PING OK
set /a lastFails=0
goto end

:fail
echo %date%;%time:~0,8%;FAIL >> log.csv
echo PING FAIL
set /a fail+=1
set /a lastFails+=1
if %lastFails% equ 3 echo SENDING SMS

:end
set /a total=%fail%+%ok%
echo %ok% %fail% %lastFails% > total.txt
pause