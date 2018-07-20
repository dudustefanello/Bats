import pyperclip

arquivo = open('.\out.sql', 'r', -1, 'cp1252')
texto = arquivo.read()
print(texto)
pyperclip.copy(texto)


arquivo.close()
