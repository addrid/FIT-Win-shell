@echo off

FOR /F „TOKENS=1“ a in (tokill.tmp) DO (\\ taskkill /FI "USERNAME eq Uzivatel" /IM a | FIND „SUCCESS“
IF %errorlevel% equ 0 echo %%a >> log.txt\\
)