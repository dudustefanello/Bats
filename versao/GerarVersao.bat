@ set ARQUIVO=C:\Users\eduar\OneDrive\Documentos\Bats\Versao\versao.log
@ echo. > %ARQUIVO%

@ set TESTE=2
@ set TRUNK=3

@ set LOGGING=start /b /wait .\GravarLog.bat /i

@ %LOGGING% Abrir navegador em Gerar Versao
  @ start C:\Users\eduar\AppData\Local\Vivaldi\Application\vivaldi --new-window http://104.236.197.223/sac/projects/desenvolvimento-flextotal/issues?query_id=145

@ echo Versao Teste: %TESTE%
@ echo Versao Trunk: %TRUNK%
@ set /p version=Versao [%TESTE%, %TRUNK%]:

@ if %version% equ %TESTE% (
    @ %LOGGING% Editar Change.log da 5.0.%TESTE%
      @ start /b /wait Cabecalho.bat /i %TESTE%
      @ notepad C:\Fontes\flextotal_5_0_%TESTE%\Flextotal\Change.log
    @ start Versao.bat /i %TESTE%

    @ %LOGGING% Editar Change.log da 5.0.%TRUNK%
      @ notepad C:\Fontes\flextotal_5_0_%TRUNK%\Flextotal\Change.log
    @ start Versao.bat /i %TRUNK%
  )

@ if %version% equ %TRUNK% (
    @ %LOGGING% Editar Change.log da 5.0.%TRUNK%
      @ start /b /wait Cabecalho.bat /i %TRUNK%
      @ notepad C:\Fontes\flextotal_5_0_%TRUNK%\Flextotal\Change.log
    @ start Versao.bat /i %TRUNK%
  )
@ exit
