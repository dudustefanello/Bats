import pyperclip
import subprocess

texto = pyperclip.paste()

linhas = str(texto).splitlines()

for linha in linhas:
    if linha 

    for remove in remover:
        linha = linha.replace(remove, '', 1)
    arquivo = open('.\out.sql', 'a', -1, 'cp1252')
    arquivo.write(linha.lower() + '\n')
    arquivo.close
    print(linha)
