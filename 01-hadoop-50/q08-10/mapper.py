import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
from operator import itemgetter

if __name__ == "__main__":

    ##
    ## itera sobre cada linea de codigo recibida
    ## a traves del flujo de entrada
    ##
     tup = []
     for line in sys.stdin:
        letter = line.split()[0]
       # letter = letter.split(',')[1]
        value = line.split()[2]
       # value = value.split(',')[0]
        tup.append((letter, value))

tup2=sorted([row for row in tup], key=itemgetter(0))

for row in tup2:
    sys.stdout.write("{}\t{}\t1\n".format(row[0], row[1]))  
