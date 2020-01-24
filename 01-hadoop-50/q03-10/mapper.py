import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":


   for line in sys.stdin:
       letra =  line.split(',')[0]
       valor = line.split(',')[1]
       sys.stdout.write("{}\t{}".format(letra, valor))
