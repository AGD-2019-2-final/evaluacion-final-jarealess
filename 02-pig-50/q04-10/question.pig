--
-- Pregunta
-- ===========================================================================
-- 
-- El archivo `truck_event_text_partition.csv` tiene la siguiente estructura:
-- 
--   driverId       INT
--   truckId        INT
--   eventTime      STRING
--   eventType      STRING
--   longitude      DOUBLE
--   latitude       DOUBLE
--   eventKey       STRING
--   correlationId  STRING
--   driverName     STRING
--   routeId        BIGINT
--   routeName      STRING
--   eventDate      STRING
-- 
-- Escriba un script en Pig que carge los datos y obtenga los primeros 10 
-- registros del archivo para las primeras tres columnas, y luego, ordenados 
-- por driverId, truckId, y eventTime. 
--
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
-- 
--  >>> Escriba su respuesta a partir de este punto <<<
-- 
-- se eliminan archivos en hdfs

fs -rm -r -f *.tsv *.csv

-- copia de archivos del sistema local al HDFS

fs -put truck_event_text_partition.csv

-- carga de archivos

u = LOAD 'truck_event_text_partition.csv' USING PigStorage(',')  
    AS (driverId:INT, 
         truckId:INT, 
         eventTime:CHARARRAY, 
         eventType:CHARARRAY, 
         longitude:DOUBLE, 
         latitude:DOUBLE, 
         eventKey:CHARARRAY,
         correlationId:CHARARRAY, 
         driverName:CHARARRAY,  
         routeId:INT,
         routeName:CHARARRAY, 
         eventDate:CHARARRAY);

-- tres primeras columnas

uu = FOREACH u GENERATE driverId, truckId, eventTime;

-- primeras 10 filas

zz = LIMIT uu 10;

-- orden

z = ORDER zz BY $0, $1, $2;

-- almacenamiento dentro de output

STORE z INTO 'output' USING PigStorage(',');

-- copia de archivos del HDFS al sistema local

-- fs -get output/ 




