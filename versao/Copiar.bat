@ %LOGGING% Copiar Executaveis para %REPOSITORIO%
  @ XCopy /q C:\Fontes\flextotal_5_0_%2\Flextotal\bin\Retaguarda\*.exe C:\Distribuicao\%REPOSITORIO%\Flextotal\bin\retaguarda /y

@ %LOGGING% Copiar Mapas para %REPOSITORIO%
  @ XCopy /q C:\Fontes\flextotal_5_0_%2\Flextotal\bin\Retaguarda\*.map C:\Distribuicao\%REPOSITORIO%\Flextotal\bin\retaguarda /y

@ %LOGGING% Copiar DDLs para %REPOSITORIO%
  @ Xcopy /q C:\Fontes\flextotal_5_0_%2\Flextotal\ddl\* C:\Distribuicao\%REPOSITORIO%\Flextotal\ddl /e /i /h /y

@ %LOGGING% Copiar Change.log para %REPOSITORIO%
  @ XCopy /q C:\Fontes\flextotal_5_0_%2\Flextotal\Change.log C:\Distribuicao\%REPOSITORIO%\Flextotal /y

  @ if %2 equ %TRUNK% (
    @ %LOGGING% Copiar Change.log para trunk
      XCopy /q C:\Fontes\flextotal_5_0_%2\Flextotal\Change.log C:\Fontes\trunk\Flextotal /y
    )

@ exit
