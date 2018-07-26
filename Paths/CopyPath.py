import pyperclip
import sys
import re

Arg = str(sys.argv[1])
Words = re.split('([A-Z a-z 0-9 _]+\.pas)', Arg)
Unit = Words[1].replace('.pas', '')
Path = Words[0].replace('C:\\Fontes\\trunk\\', '..\\..\\..\\')

pyperclip.copy('\n  ' + Unit + " in '" + Path + Unit + ".pas',");
