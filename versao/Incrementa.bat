@ if %2 equ %TESTE% (
  @ %LOGGING% Incrementa FlexSmart
    @ powershell.exe -file .\incrementa.ps1 -arquivo 1
  @ %LOGGING% Incrementa Integrador
    @ powershell.exe -file .\incrementa.ps1 -arquivo 2
  @ %LOGGING% Incrementa Importador
    @ powershell.exe -file .\incrementa.ps1 -arquivo 3
  )
@ if %2 equ %TRUNK% (
  @ %LOGGING% Incrementa FlexSmart
    @ powershell.exe -file .\incrementa.ps1 -arquivo 4
  @ %LOGGING% Incrementa Integrador
    @ powershell.exe -file .\incrementa.ps1 -arquivo 5
  @ %LOGGING% Incrementa Importador
    @ powershell.exe -file .\incrementa.ps1 -arquivo 6
  )
@ exit
