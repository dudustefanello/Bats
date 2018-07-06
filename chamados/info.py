import pyperclip
import subprocess
import time
import re

chamado = str()
texto = str()
partes = tuple()
linhas = list(str())

link = 'http://104.236.197.223/sac/issues/'

titulos = [('###### ','h6. '),('##### ','h5. '),('#### ','h4. '),('### ','h3. '),('## ','h2. '),('# ','h1. ')]

indices = [('      - ', '      * '),('    - ', '    * '),('  - ', '  * '),('- ', '* '),
           ('      1. ','      # '),('    1. ','    # '),('  1. ','  # '),('1. ','# ')]

delphi  = [(' ``', ' <code class="Delphi">'),('`` ', '</code> '),('``.', '</code>.'),
           ('``,', '</code>,'),('``:', '</code>:'),('``;', '</code>;')]

codigos = [(' `', ' @'),('` ', '@ '),
           ('\n`', '\n@'),('`\n', '@\n'),
           ('`,', '@,'),('`.', '@.'),
           ('`:', '@:'),('`;', '@;'),
           ('`)', '@)'),('(`', '(@')]

negrito = [(' **', ' *'),('** ', '* '),('**,', '*,'),('**.', '*.'),('**:', '*:'),('**;', '*;')]

arquivo = open('info.md', 'r')
texto = arquivo.read()

partes = re.split('(#[0-9]{5})', texto, 1)

chamado = partes[1]
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
pyperclip.copy('h1.' + texto);
subprocess.call(['TortoiseProc.exe', '/path:C:/Fontes/trunk', '/closeonend:3', '/command:commit', '/logmsg:' + '#' + chamado])

#print(chamado)
#print(texto)
#time.sleep(50)
