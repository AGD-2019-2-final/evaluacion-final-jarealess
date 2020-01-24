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
--    WHERE 
--        color REGEXP 'blue|green';
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

uu = FOREACH u GENERATE firstname, color;

-- filtro;

zz = FILTER uu BY (($1 == 'blue') OR ($1 == 'green'));

-- resultado

z = FOREACH zz GENERATE $0, $1;

-- almacenamiento

STORE z INTO 'output';


