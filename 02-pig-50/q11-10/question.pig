-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Escriba el código que genere la siguiente salida.
-- 
--    Boyer,BOYER,boyer
--    Coffey,COFFEY,coffey
--    Conway,CONWAY,conway
--    Crane,CRANE,crane
--    Diaz,DIAZ,diaz
--    Estes,ESTES,estes
--    Fry,FRY,fry
--    Garrett,GARRETT,garrett
--    Guy,GUY,guy
--    Hamilton,HAMILTON,hamilton
--    Holcomb,HOLCOMB,holcomb
--    Jarvis,JARVIS,jarvis
--    Kinney,KINNEY,kinney
--    Klein,KLEIN,klein
--    Knight,KNIGHT,knight
--    Noel,NOEL,noel
--    Sexton,SEXTON,sexton
--    Silva,SILVA,silva
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
fs -rm -f -r *.csv

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
-- ordenamiento 

uu = ORDER u BY surname;

-- columa de interes

z = FOREACH uu GENERATE $2, UPPER($2), LOWER($2);

-- almacenamiento

STORE z INTO 'output' USING PigStorage(',');


-- copia de archivos del HDFS al sistema local

-- fs -get output/ ;
