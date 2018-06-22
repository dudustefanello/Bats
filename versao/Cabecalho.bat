@ set /p linha=<C:\Fontes\flextotal_5_0_%2\FlexTotal\Change.log
@ set /a head=%linha:~14,2% + 1
@ echo 5.0.%2 HEAD %head% ^| Data %date% ^| Hora %time:~0,5% > C:\Users\eduar\OneDrive\Documentos\Bats\versao\toCommit%2.txt
@ clip < C:\Users\eduar\OneDrive\Documentos\Bats\versao\toCommit%2.txt
@ exit
