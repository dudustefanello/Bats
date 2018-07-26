@REM paths das units adicionadas ao projeto na revisão: rev
@set rev=48962
@set url=C:\Fontes\trunk

@TortoiseProc.exe /command:showcompare /url1:%url% /revision1:%rev% /URL2:%url% /revision2:HEAD
