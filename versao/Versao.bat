@ if %2 equ %OLDER% set REPOSITORIO=temporario
@ if %2 equ %TESTE% set REPOSITORIO=svnteste
@ if %2 equ %TRUNK% set REPOSITORIO=svntrunk

@ %LOGGING% Limpar DCUs 5.0.%2
  @ %STARTER% Clear.bat /i %2

@ %LOGGING% Update Fontes Versao 5.0.%2
  @ %STARTER% Update.bat /i %2

@ %LOGGING% Alterar a Versao nos Projetos da 5.0.%2
  @ %STARTER% Incrementa.bat /i %2

@ %LOGGING% Abrir Delphi e Construir Projetos da 5.0.%2
  @ start /realtime /wait bds -b C:\Fontes\flextotal_5_0_%2\Flex_5.0.%2.groupproj -oC:\Users\eduar\GitHub\Bats\versao\build%2.log

@ %STARTER% Compactar.bat /i %2

@ %LOGGING% Copiar Arquivos para Distribuicao
  @ %STARTER% Copiar.bat /i %2

@ %LOGGING% Commit 5.0.%2
  @ %STARTER% Commit.bat /i %2

@ %LOGGING% Alterar a SITUACAO dos chamados da 5.0.%2
@ %LOGGING% Atribuir os chamados a NINGUEM
@ %LOGGING% COLAR o Log dos chamados da 5.0.%2
  @ notepad C:\Users\eduar\GitHub\Bats\versao\toCommit%2.txt

@ exit
