import os

a = ""
with open("info_sh.txt",encoding="utf-8") as f:
 a = f.readlines()[-9:]
print(a)
