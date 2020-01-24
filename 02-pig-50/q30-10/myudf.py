## Fnucionn para obtener el dia de la semana
from pig_util import outputSchema

import datetime

semana = ['lunes', 'martes', 'miercoles', 'jueves', 'viernes', 'sabado', 'domingo']
sem = ['lun', 'mar', 'mie', 'jue', 'vie', 'sab', 'dom']

@outputSchema("as:chararray")
def getdia(input):
    anno, mes, dia = input.split('-')
    dd = datetime.date(int(anno), int(mes), int(dia)).weekday()
    return(semana[dd])

@outputSchema("as2:chararray")
def getd(input2):
    anno, mes, dia = input2.split('-')
    dd = datetime.date(int(anno), int(mes), int(dia)).weekday()
    return(sem[dd])

@outputSchema("as3:chararray")
def concatenar(num):
    if int(num) < 10:
       return ('%02d' % int(num))
    else:
       return(num)

