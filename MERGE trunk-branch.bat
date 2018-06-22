TortoiseProc.exe /path:"C:\FONTES\trunk" /closeonend:3 /command:update
set /p coment=Comentario:
TortoiseProc.exe /path:"C:\FONTES\trunk" /closeonend:3 /command:commit /logmsg:%coment%
set /p version=Branch Name:
:loop
	TortoiseProc.exe /path:"C:\FONTES\flextotal_%version%" /closeonend:3 /command:update
	TortoiseProc.exe /path:"C:\FONTES\flextotal_%version%\Flextotal\" /closeonend:3 /command:merge /fromURL:"http://192.168.1.254:81/svnfontes/infoger/trunk/Flextotal"
	TortoiseProc.exe /path:"C:\FONTES\flextotal_%version%\FrameworkDelphi\" /closeonend:3 /command:merge /fromURL:"http://192.168.1.254:81/svnfontes/infoger/trunk/FrameworkDelphi"
	TortoiseProc.exe /path:"C:\FONTES\flextotal_%version%\NucleoFlextotal\" /closeonend:3 /command:merge /fromURL:"http://192.168.1.254:81/svnfontes/infoger/trunk/NucleoFlextotal"
	TortoiseProc.exe /path:"C:\FONTES\flextotal_%version%" /closeonend:3 /command:commit /logmsg:%coment%
	set /p version=Branch Name:
if %version% neq x (goto loop)
