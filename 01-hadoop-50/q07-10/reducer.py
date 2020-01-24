import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
from operator import itemgetter
if __name__ == '__main__':

   
    ##
    ## cada linea de texto recibida es una
    ## entrada clave \tabulador valor
    ##

    tup = []
    for line in sys.stdin:
       letter = line.split("\t")[0]
       date = line.split("\t")[1]
       value = line.split("\t")[2]
       value = int(value)
       tup.append((letter, date, value))
           
 
tup2=sorted([row for row in tup], key=itemgetter(0,2))

for row in tup2:
    sys.stdout.write("{}\t{}\t{}\n".format(row[0], row[1], row[2]))           
