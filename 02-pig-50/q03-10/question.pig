-- Pregunta
-- ===========================================================================
-- 
-- Obtenga los cinco (5) valores más pequeños de la 3ra columna.
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

u = LOAD 'data.tsv' AS (f1:CHARARRAY, f2:CHARARRAY, f3:INT);


-- ordenamiento de registros

uu = ORDER u BY f3;

-- fila 3

zz = FOREACH uu GENERATE $2;

-- 5 valores más pequeños

z = LIMIT zz 5;

-- almacenamiento dentro de output

STORE z INTO 'output';

-- copia de archivos del HDFS al sistema local

-- fs -get output/ ;
