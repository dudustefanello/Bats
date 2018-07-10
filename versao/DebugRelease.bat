@ if %2 equ %OLDER% (
  set tipo="Release"
)
@ if %2 equ %TESTE% (
  set tipo="Release"
)
@ if %2 equ %TRUNK% (
  set tipo="Debug"
)

@ %LOGGING% Trocar configuração do FlexSmart para %tipo%
  @ powershell.exe -file .\debugRelease.ps1 -arquivo "C:\Fontes\flextotal_5_0_%2\Flextotal\src\retaguarda\FlexTotal.dproj" -tipo %tipo%
@ %LOGGING% Trocar configuração do Integrador para %tipo%
  @ powershell.exe -file .\debugRelease.ps1 -arquivo "C:\Fontes\flextotal_5_0_%2\Flextotal\src\integracao pafecf\IntegracaoPAFECF.dproj" -tipo %tipo%
@ %LOGGING% Trocar configuração do Importador para %tipo%
  @ powershell.exe -file .\debugRelease.ps1 -arquivo "C:\Fontes\flextotal_5_0_%2\Flextotal\src\importa pedidos venda\ImportacaoPedidosVenda.dproj" -tipo %tipo%

@ exit
