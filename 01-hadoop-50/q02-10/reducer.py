import sys
#
#  >>> Escriba el codigo del reducer a partir de este punto <<<
#
if __name__=='__main__':



    curkey = None
    maxim = 0


    for line in sys.stdin:
        key, cant = line.split("\t")
        cant = int(cant)


        if key == curkey:

           if cant > maxim:
              maxim = cant

        else:

             if curkey is not None:

                 sys.stdout.write("{}\t{}\n".format(curkey, maxim))
                 maxim = 0  
    
             curkey = key

    sys.stdout.write("{}\t{}\n".format(curkey, maxim))
