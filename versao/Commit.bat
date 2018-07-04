@ set /p linha=<C:\Fontes\flextotal_5_0_%2\FlexTotal\Change.log
@ echo %linha:~3,14%^|^ %linha:~19,16%^|^ %linha:~37,10% > C:\Users\eduar\GitHub\Bats\versao\toCommit%2.txt

@ %LOGGING% Commit C:\Fontes\flextotal_5_0_%2
  @ TortoiseProc.exe /path:"C:\Fontes\flextotal_5_0_%2" /closeonend:3 /command:commit /logmsgfile:"C:\Users\eduar\GitHub\Bats\versao\toCommit%2.txt"

@ %LOGGING% Commit C:\Distribuicao\%REPOSITORIO%
  @ TortoiseProc.exe /path:"C:\Distribuicao\%REPOSITORIO%" /closeonend:3 /command:commit /logmsgfile:"C:\Users\eduar\GitHub\Bats\versao\toCommit%2.txt"

@ if %2 equ %TRUNK% (
  @ %LOGGING% Commit C:\Fontes\trunk\Change.log
    @ TortoiseProc.exe /path:"C:\Fontes\trunk\FlexTotal\Change.log" /closeonend:3 /command:commit /logmsgfile:"C:\Users\eduar\GitHub\Bats\versao\toCommit%2.txt"
  )

@ exit
