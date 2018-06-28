import pyperclip
import subprocess
import time

chamado = str()
texto = str()
partes = tuple()
linhas = list(str())

link = 'http://104.236.197.223/sac/issues/'

titulos = [('###### ','h6. '),('##### ','h5. '),('#### ','h4. '),('### ','h3. '),('## ','h2. '),('# ','h1. ')]

negrito = [(' **', ' *'),('** ', '* '),('**,', '*,'),('**.', '*.'),('**:', '*:'),('**;', '*;')]

indices = [('      - ', '**** '),('    - ', '*** '),('  - ', '** '),('- ', '* '),
           ('      1. ','#### '),('    1. ','### '),('  1. ','## '),('1. ','# ')]

delphi  = [(' ``', ' <code class="Delphi">'),('`` ', '</code> '),('``.', '</code>.'),
           ('``,', '</code>,'),('``:', '</code>:'),('``;', '</code>;')]

codigos = [(' `', ' @'),('` ', '@ '),('`,', '@,'),('`.', '@.'),('`:', '@:'),('`;', '@;')]


arquivo = open('info.md', 'r')
texto = arquivo.read()

partes = texto.rpartition('#info')
chamado = partes[0]
linhas = partes[2].splitlines(True);

texto = ''

for linha in linhas:
    for i in titulos:
        if linha.rfind(i[0]) >= 0:
            linha = linha.replace(i[0], i[1])
            linha = linha.replace('\n', '\n\n')

    for i in delphi:
        linha = linha.replace(i[0], i[1])

    for i in codigos:
        linha = linha.replace(i[0], i[1])

    for i in negrito:
        linha = linha.replace(i[0], i[1])

    for i in indices:
        linha = linha.replace(i[0], i[1])

    texto += linha

subprocess.call(['C:/Fontes/trunk/AtualizadorScriptsBanco/Win32/AtualizadorScriptsBanco.exe'])

chamado = chamado.replace('#', '')
subprocess.call(['C:/Users/eduar/AppData/Local/Vivaldi/Application/vivaldi', '--new-window', link + chamado])
pyperclip.copy('h1. #info\n\n' + texto);

subprocess.call(['TortoiseProc.exe', '/path:C:/Fontes/trunk', '/closeonend:3', '/command:commit', '/logmsg:' + '#' + chamado])
