import pyperclip

arquivo = open('.\out.sql', 'r', -1, 'cp1252')
texto = arquivo.read()
arquivo.close()

arquivo = open('.\out.sql', 'w', -1, 'cp1252')
arquivo.write('')
arquivo.close  

linhas = texto.splitlines()

for linha in linhas:
    if linha == linhas[-1]:
        linha = "    \'" + linha + "\';"
    else:
        linha = "    \'" + linha + " \' +"
    arquivo = open('.\out.sql', 'a', -1, 'cp1252')
    arquivo.write(linha + '\n')
    arquivo.close  
    print(linha)

arquivo = open('.\out.sql', 'r', -1, 'cp1252')
texto = arquivo.read()
arquivo.close()

pyperclip.copy(texto)

