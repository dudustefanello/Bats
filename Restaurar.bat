@ chcp 1252

@ cd C:\Backup\Bancos

@ dir

@ set /p caminho=Arquivo...:
@ set /p database=Database.:

@ set /p tipo=[1.psql/2.pg_restore]:

@ if %tipo% equ 1 start /b /wait /realtime C:\PostgreSQL\pg96\bin\psql.exe -h localhost -U postgres -d %database% < %caminho%
@ if %tipo% equ 2 start /b /wait /realtime C:\PostgreSQL\pg96\bin\pg_restore.exe -j 32 -h localhost -U postgres -d %database% %caminho%
