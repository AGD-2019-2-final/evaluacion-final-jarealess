-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` genere una tabla que contenga la primera columna,
-- la cantidad de elementos en la columna 2 y la cantidad de elementos en la 
-- columna 3 separados por coma. La tabla debe estar ordenada por las 
-- columnas 1, 2 y 3.
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

-- CONTEO DE LONGITUDES

uu = FOREACH u GENERATE f1, SIZE(f2), SIZE(f3);

-- ordenamiento

z = ORDER uu BY $0, $1, $2;

-- almacenamiento

STORE z INTO 'output' USING PigStorage(',');


-- copia de archivos del HDFS al sistema local

-- fs -get output/ ;
