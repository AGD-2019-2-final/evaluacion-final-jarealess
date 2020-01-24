import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == '__main__':

    acletter = None
    maxim = 0
    minim = 1
    minim1 = 1
    
    ##
    ## cada linea de texto recibida es una
    ## entrada clave \tabulador valor
    ##
    for line in sys.stdin:

        letter, val= line.split("\t")
        val = float(val)
        minim1 = val
                       
        if letter == acletter:
            ##
            ## No se ha cambiado de clave. Aca se
            ## acumulan los valores para la misma clave.
            ##
            
            if val > maxim:
               maxim = val
            
            if minim1 < minim:
               minim = minim1
                           
        else:
            ##
            ## Se cambió de clave. Se reinicia el
            ## acumulador.
            ##
            if acletter is not None:
                ##
                ## una vez se han reducido todos los elementos
                ## con la misma clave se imprime el resultado en
                ## el flujo de salida
                ##
                sys.stdout.write("{}\t{}\t{}\n".format(acletter, maxim, minim))
                maxim = 0

            minim = val
            maxim=val         
            acletter = letter
            
            
    sys.stdout.write("{}\t{}\t{}\n".format(acletter, maxim, minim))       
