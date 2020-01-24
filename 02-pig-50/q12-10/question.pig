-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Obtenga los apellidos que empiecen por las letras entre la 'd' y la 'k'. La 
-- salida esperada es la siguiente:
-- 
--   (Hamilton)
--   (Holcomb)
--   (Garrett)
--   (Fry)
--   (Kinney)
--   (Klein)
--   (Diaz)
--   (Guy)
--   (Estes)
--   (Jarvis)
--   (Knight)
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
uu = FOREACH u GENERATE surname, SUBSTRING(surname, 0, 1); 

-- Apellidos entre d y k;

zz = FILTER uu BY (($1 > 'C') AND ($1 < 'L'));

-- resultado

z = FOREACH zz GENERATE $0;

-- almacenamiento

STORE z INTO 'output';


-- copia de archivos del HDFS al sistema local

-- fs -get output/ ;

