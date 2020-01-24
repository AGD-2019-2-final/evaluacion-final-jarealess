import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
from operator import itemgetter
import re

if __name__ == "__main__":

    ##
    ## itera sobre cada linea de codigo recibida
    ## a traves del flujo de entrada
    ##

    tup = []
   
    for line in sys.stdin:
        value = line.split('\t')[0]
        value = int(value)
        lista = line.split('\t')[1]
             
        for letra in lista.split(','):
            letra = letra[0:1]
            tup.append((letra, value))

  
tup2 = sorted([row for row in tup], key = itemgetter(0))

for row in tup2:
    letra = row[0]
    valor = row[1]
    sys.stdout.write("{}\t{}\n".format(letra, valor))
        
