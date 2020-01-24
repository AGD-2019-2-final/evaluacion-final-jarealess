import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
from operator import itemgetter
import time, datetime

if __name__ == "__main__":

   tup = []
   for line in sys.stdin:
       fecha = line.split()[1]
       mes = datetime.datetime.strptime(fecha, '%Y-%m-%d').strftime('%m')
       tup.append((mes, 1))

tup2 = sorted([row for row in tup], key = itemgetter(0))

for row in tup2:
   sys.stdout.write("{}\t{}\n".format(row[0], row[1]))
