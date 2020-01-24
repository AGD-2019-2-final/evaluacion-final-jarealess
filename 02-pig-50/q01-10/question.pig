-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute la cantidad de registros por letra. 
-- Escriba el resultado a la carpeta `output` del directorio actual.
--
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
-- copia de archivos del sistema local al HDFS

fs -put data.tsv

-- carga de archivos

u = LOAD 'data.tsv' AS (f1:CHARARRAY, f2:CHARARRAY, f3:INT);

-- muestra solo columna 1

uu = FOREACH u GENERATE f1;

-- agruación de elementos

grupo = GROUP uu BY $0; 

-- conteo del número de registros por letra

z = FOREACH grupo GENERATE $0, COUNT(uu);


-- almacenamiento dentro de output

STORE z INTO 'output';

-- copia de archivos del HDFS al sistema local

-- fs -get output


