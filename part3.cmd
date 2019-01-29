pozn: Názvy procesù jsou naèítány z externího souboru evilProcesses.txt, co øádek, to proces. REM treti ukol
@ECHO OFF

set username="addrid"

TASKLIST /FI „USERNAME eq %username%“ >> currentProcesses.txt
FOR /F „tokens=1“ A in (evilProcesses.txt) do (\\ echo Bude vyhledan a zabit proces A.
PAUSE

FOR /F „tokens=1,2“ I in (currentProcesses.txt) do (\\ IF I==A (\\ echo Nalezen proces I.
TASKKILL /PID %%J\\
)
)
)

PAUSE
