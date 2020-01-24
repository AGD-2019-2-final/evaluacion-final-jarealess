-- 
-- Pregunta
-- ===========================================================================
--
-- Para resolver esta pregunta use el archivo `data.tsv`.
--
-- Construya una consulta que ordene la tabla por letra y valor (3ra columna).
--
-- Escriba el resultado a la carpeta `output` de directorio de trabajo.
--
-- >>> Escriba su respuesta a partir de este punto <<<
--

DROP TABLE IF EXISTS data;


CREATE TABLE data (letra STRING, 
                   fecha STRING, 
                   valor INT)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t';



LOAD DATA LOCAL INPATH 'data.tsv' OVERWRITE INTO TABLE data;

DROP TABLE IF EXISTS conteo;
CREATE TABLE conteo AS SELECT * FROM data ORDER BY letra, valor, fecha;
                   

INSERT OVERWRITE LOCAL DIRECTORY 'output'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
SELECT * FROM conteo;
