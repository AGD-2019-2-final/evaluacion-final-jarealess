--
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Escriba el código equivalente a la siguiente consulta SQL.
-- 
--    SELECT 
--        firstname,
--        color
--    FROM 
--        u 
--    WHERE color = 'blue' AND firstname LIKE 'Z%';
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
fs -rm -r -f *.csv

-- copia de archivos del sistema local al HDFS

fs -put data.csv

-- 
u = LOAD 'data.csv' USING PigStorage(',') 
    AS (id:int, 
        firstname:CHARARRAY, 
        surname:CHARARRAY, 
        birthday:CHARARRAY, 
        color:CHARARRAY, 
        quantity:INT);
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
-- columna de interés

uu = FOREACH u GENERATE firstname, SUBSTRING(firstname, 0, 1), color;

-- colores por la b;

zz = FILTER uu BY (($2 == 'blue') AND ($1 == 'Z'));

-- resultado

z = FOREACH zz GENERATE $0, $2;

-- almacenamiento

STORE z INTO 'output';


-- copia de archivos del HDFS al sistema local

-- fs -get output/ ;

