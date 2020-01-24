import sys
#
# >>> Escriba el codigo del reducer a partir de este punto <<<
#
from operator import itemgetter
import time, datetime

if __name__ == '__main__':

    curkey = None
    val = 0

    for line in sys.stdin:
        key = line.split("\t")[0]
        valor = line.split("\t")[1]
        
        if key == curkey:
           val += 1
        else:
             if curkey is not None:
                sys.stdout.write("{},{}\n".format(curkey, val))
             curkey = key
             val = 1
        
    sys.stdout.write("{},{}\n".format(curkey, val))    


