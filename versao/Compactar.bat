@ if %2 neq %TRUNK% (
  @ %LOGGING% Compactar Executaveis
    @ %LOGGING% Compactar FlexSmart
      @ start C:\Users\eduar\GitHub\Bats\versao\upx.exe C:\Fontes\flextotal_5_0_%2\Flextotal\bin\Retaguarda\FlexTotal.exe
    @ %LOGGING% Compactar Importador
      @ start C:\Users\eduar\GitHub\Bats\versao\upx.exe C:\Fontes\flextotal_5_0_%2\Flextotal\bin\Retaguarda\ImportacaoPedidosVenda.exe
    @ %LOGGING% Compactar Integrador
      @ start /wait C:\Users\eduar\GitHub\Bats\versao\upx.exe C:\Fontes\flextotal_5_0_%2\Flextotal\bin\Retaguarda\IntegracaoPAFECF.exe
    @ waitfor /t 2 Compactar
  )
@ exit
