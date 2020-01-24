-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute Calcule la cantidad de registros en que 
-- aparece cada letra minúscula en la columna 2.
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
-- se eliminan archivos en hdfs

fs -rm -r -f *.tsv *.csv
fs -rm -r -f output

-- copia de archivos del sistema local al HDFS

fs -put data.tsv

-- carga de archivos

u = LOAD 'data.tsv'
    AS (f1:CHARARRAY, f2:BAG{t:(p:CHARARRAY)}, f3:MAP[]);


-- función FLATTEN al BAG

uu = FOREACH u GENERATE FLATTEN(f2);

-- agrupamiento

grupo = GROUP uu BY $0;

-- Conteo de cantidad de letras

z = FOREACH grupo GENERATE $0, COUNT(uu);

-- almacenamiento dentro de output

STORE z INTO 'output';

-- copia de archivos del HDFS al sistema local

-- fs -get output/ 


