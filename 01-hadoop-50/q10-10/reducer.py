import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#

if __name__ == '__main__':

   
    ##
    ## cada linea de texto recibida es una
    ## entrada clave \tabulador valor
    ##

    tup = []
    curkey = None

    for line in sys.stdin:
       key = line.split()[0]
       value = line.split()[1]
       value = int(value)
       
       if key == curkey:
         tup.append(value)

       else:
            if curkey is not None:
              tup.sort()
              tup = ','.join(str(i) for i in tup)
              sys.stdout.write("{}\t{}\n".format(curkey, tup))
              tup = []
            curkey = key 
            tup.append(value)
 
    tup.sort()
    tup = ','.join(str(i) for i in tup)
    sys.stdout.write("{}\t{}\n".format(curkey, tup))
