import sys

filetosearch = sys.argv[1]
texttoreplace = sys.argv[2]
texttoinsert = sys.argv[3]

string = open(filetosearch).read()
string = string.replace(texttoreplace, texttoinsert)
f = open(filetosearch, 'w')
f.write(string)
f.close()