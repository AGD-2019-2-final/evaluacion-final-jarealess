-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` Calcule la cantidad de registros por clave de la 
-- columna 3. En otras palabras, cuántos registros hay que tengan la clave 
-- `aaa`?
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


-- función FLATTEN al MAP

ua = FOREACH u GENERATE FLATTEN(f3);

-- obtención de claves

zz = FOREACH ua GENERATE $0;

-- agrupamiento

grupo = GROUP zz BY $0;

-- conteo

z = FOREACH grupo GENERATE $0, COUNT(zz);

-- almacenamiento dentro de output

STORE z INTO 'output' USING PigStorage(',');

-- copia de archivos del HDFS al sistema local


