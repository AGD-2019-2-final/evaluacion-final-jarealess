-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute la cantidad de registros por letra de la 
-- columna 2 y clave de al columna 3; esto es, por ejemplo, la cantidad de 
-- registros en tienen la letra `b` en la columna 2 y la clave `jjj` en la 
-- columna 3 es:
-- 
--   ((b,jjj), 216)
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

-- flatten1

uu = FOREACH u GENERATE FLATTEN(f2), f3;

-- flatten2

ua = FOREACH uu GENERATE $0, FLATTEN(f3);

-- columnas de interés

zz = FOREACH ua GENERATE $0, $1;

--  ordenamiento 

orden = ORDER zz BY $0, $1; 

-- agrupamiento

grupo = GROUP orden BY ($0, $1);

-- resultado

z = FOREACH grupo GENERATE $0, COUNT(orden);


-- almacenamiento

STORE z INTO 'output';


-- copia de archivos del HDFS al sistema local

-- fs -get output/ ;

