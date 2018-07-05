@ %LOGGING% Update 5.0.%2
  @ TortoiseProc.exe /path:"C:\Fontes\flextotal_5_0_%2" /closeonend:3 /command:update

@ if %2 neq %OLDER% (
  @ %LOGGING% Update %REPOSITORIO%
    @ TortoiseProc.exe /path:"C:\Distribuicao\%REPOSITORIO%" /closeonend:3 /command:update
  )

@ if %2 equ %TRUNK% (
  @ %LOGGING% Update Change.log no trunk
    @ TortoiseProc.exe /path:"C:\Fontes\trunk\FlexTotal\Change.log" /closeonend:3 /command:update
  )

@ exit
