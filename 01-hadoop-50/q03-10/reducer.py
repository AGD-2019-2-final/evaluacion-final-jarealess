import sys
#
# >>> Escriba el codigo del reducer a partir de este punto <<<
#
from operator import itemgetter

if __name__ == '__main__':

    tup = []

    for line in sys.stdin:
        letter = line.split("\t")[0]
        value = line.split("\t")[1]
        value = int(value)
        tup.append((letter, value))

tup2 = sorted([row for row in tup], key = itemgetter(1))  

for row in tup2:
      key, value = row[0], row[1]     
      sys.stdout.write("{},{}\n".format(key, value))
