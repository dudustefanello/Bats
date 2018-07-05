@ set ARQUIVO=C:\Users\eduar\GitHub\Bats\versao\versao.log
@ echo. > %ARQUIVO%

@ set OLDER=1
@ set TESTE=2
@ set TRUNK=3

@ set STARTER=start /b /wait
@ set LOGGING=%STARTER% .\GravarLog.bat /i

@ %LOGGING% Abrir navegador em Gerar Versao
  @ start C:\Users\eduar\AppData\Local\Vivaldi\Application\vivaldi --new-window http://104.236.197.223/sac/projects/desenvolvimento-flextotal/issues?query_id=145

@ echo Versao Teste: %TESTE%
@ echo Versao Trunk: %TRUNK%
@ set /p version=Versao [%TESTE%, %TRUNK%]:

@ if %version% equ %OLDER% (
    @ %LOGGING% Editar Change.log da 5.0.%OLDER%
      @ %STARTER% Cabecalho.bat /i %OLDER%
      @ notepad C:\Fontes\flextotal_5_0_%OLDER%\Flextotal\Change.log
    @ start Versao.bat /i %OLDER%

    @ %LOGGING% Editar Change.log da 5.0.%TESTE%
      @ notepad C:\Fontes\flextotal_5_0_%TESTE%\Flextotal\Change.log
    @ start Versao.bat /i %TESTE%

    @ %LOGGING% Editar Change.log da 5.0.%TRUNK%
      @ notepad C:\Fontes\flextotal_5_0_%TRUNK%\Flextotal\Change.log
    @ start Versao.bat /i %TRUNK%
  )

@ if %version% equ %TESTE% (
    @ %LOGGING% Editar Change.log da 5.0.%TESTE%
      @ %STARTER% Cabecalho.bat /i %TESTE%
      @ notepad C:\Fontes\flextotal_5_0_%TESTE%\Flextotal\Change.log
    @ start Versao.bat /i %TESTE%

    @ %LOGGING% Editar Change.log da 5.0.%TRUNK%
      @ notepad C:\Fontes\flextotal_5_0_%TRUNK%\Flextotal\Change.log
    @ start Versao.bat /i %TRUNK%
  )

@ if %version% equ %TRUNK% (
    @ %LOGGING% Editar Change.log da 5.0.%TRUNK%
      @ %STARTER% Cabecalho.bat /i %TRUNK%
      @ notepad C:\Fontes\flextotal_5_0_%TRUNK%\Flextotal\Change.log
    @ start Versao.bat /i %TRUNK%
  )
@ exit
