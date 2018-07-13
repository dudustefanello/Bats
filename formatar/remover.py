import pyperclip
import subprocess

remover = ["'",

           "'+sLineBreak+",
           "'+sLineBreak +",
           "'+ sLineBreak+",
           "'+ sLineBreak +",
           "' +sLineBreak+",
           "' +sLineBreak +",
           "' + sLineBreak+",
           "' + sLineBreak +",

           "'+#13+",
           "'+#13 +",
           "'+ #13+",
           "'+ #13 +",
           "' +#13+",
           "' +#13 +",
           "' + #13+",
           "' + #13 +",

           "'+#13#10+",
           "'+#13#10 +",
           "'+ #13#10+",
           "'+ #13#10 +",
           "' +#13#10+",
           "' +#13#10 +",
           "' + #13#10+",
           "' + #13#10 +",
           "'+#13 #10+",
           "'+#13 #10 +",
           "'+ #13 #10+",
           "'+ #13 #10 +",
           "' +#13 #10+",
           "' +#13 #10 +",
           "' + #13 #10+",
           "' + #13 #10 +",

           "' +",
           "'+",

           "' ;",
           "';"]

texto = pyperclip.paste()

arquivo = open('.\out.sql', 'w', -1, 'cp1252')
arquivo.write('')
arquivo.close

linhas = str(texto).splitlines()
for linha in linhas:
    for remove in remover:
        linha = linha.replace(remove, '', 1)
    arquivo = open('.\out.sql', 'a', -1, 'cp1252')
    arquivo.write(linha + '\n')
    arquivo.close
    print(linha)
