setlocal enabledelayedexpansion
set file="filename.txt"
set username="user"
set program="abc"
set program2="def"

:START
for /f "delims=" %%i in (%filename%) do (
prgrm= %%i
echo %prgrm%

if %program% equ "!prgrm!" (GOTO END)
set prog=!prgrm!
for /f "tokens=1" %%a in ('"tasklist /fi "username eq %uname%" | find /c %prgrm%"') do (
set count_instance=%%a
)
if "!count_instance!" geq 1 (
taskkill /fi "username eq %uname%" /im %prgrm%
echo %date% ; %time% ; %prgrm% ; !count_instance! ; %uname% >>vystup.csv
)
)
GOTO START
:END