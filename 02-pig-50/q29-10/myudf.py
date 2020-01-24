## Funcion para obtener nombre abreviado del mes
## Funcion para agregar '0' delante del numero
from pig_util import outputSchema

@outputSchema("as:chararray")
def mes(num):
    if num == 1:
        return ('ene')
    elif num == 2:
        return ('feb')
    elif num == 3:
        return ('mar')
    elif num == 4:
        return ('abr')
    elif num == 5:
        return ('may')
    elif num == 6:
        return ('jun')
    elif num == 7:
        return ('jul')
    elif num == 8:
        return ('ago')
    elif num == 9:
        return ('sep')
    elif num == 10:
        return ('oct')
    elif num == 11:
        return ('nov')
    else:
        return ('dic')
    

@outputSchema("as2:chararray")
def concatenar(input):
    if int(input) < 10:
       return ('%02d' % input)
    else:
       return (input)
