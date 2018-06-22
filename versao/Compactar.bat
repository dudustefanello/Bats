@ if %2 equ %TESTE% (
  @ %LOGGING% Compactar Executaveis
    @ %LOGGING% Compactar FlexSmart
      @ start C:\Users\eduar\OneDrive\Documentos\Bats\versao\upx.exe C:\Fontes\flextotal_5_0_%TESTE%\Flextotal\bin\Retaguarda\FlexTotal.exe
    @ %LOGGING% Compactar Importador
      @ start C:\Users\eduar\OneDrive\Documentos\Bats\versao\upx.exe C:\Fontes\flextotal_5_0_%TESTE%\Flextotal\bin\Retaguarda\ImportacaoPedidosVenda.exe
    @ %LOGGING% Compactar Integrador
      @ start /wait C:\Users\eduar\OneDrive\Documentos\Bats\versao\upx.exe C:\Fontes\flextotal_5_0_%TESTE%\Flextotal\bin\Retaguarda\IntegracaoPAFECF.exe
    @ waitfor /t 2 Compactar
  )
@ exit
