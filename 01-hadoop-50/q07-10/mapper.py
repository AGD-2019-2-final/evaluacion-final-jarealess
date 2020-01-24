import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":

    ##
    ## itera sobre cada linea de codigo recibida
    ## a traves del flujo de entrada
    ##
     tup = []
     for line in sys.stdin:
        letter = line.split()[0]
       # letter = letter.split(',')[1]
        date = line.split()[1]
        value = line.split()[2]
       # value = value.split(',')[0]
        sys.stdout.write("{}\t{}\t{}\n".format(letter, date, value))
