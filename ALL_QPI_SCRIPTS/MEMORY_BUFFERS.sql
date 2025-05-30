--------------------------------------------------------
--  DDL for View MEMORY_BUFFERS
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "QPI_RBL_MISDB_PROD"."MEMORY_BUFFERS" ("DB_NAME", "BUFFER_GB", "BUFFER_PERCENT", "READ_TIME_MS", "MODIFIED_PERC") AS 
  WITH src AS ( SELECT database_id ,
                        COUNT(*)  db_buffer_pages  ,
                        AVG(read_microsec)  / 1000. read_time_ms  ,
                        (100 * SUM(CASE 
                                        WHEN is_modified = 1 THEN 1
                                   ELSE 0
                                      END) ) / COUNT(*)  modified_perc  
     FROM sys.dm_os_buffer_descriptors 

   --WHERE database_id BETWEEN 5 AND 32766 --> to exclude system databases
   GROUP BY ROLLUP( database_id ) ) 
      SELECT CASE 
                  WHEN database_id = 32767 THEN 'Resource DB'
                  WHEN database_id IS NULL THEN '--> TOTAL:'
             ELSE SYS_CONTEXT('USERENV','')
                END db_name  ,
             db_buffer_pages / 128 / 1024 buffer_gb  ,
             UTILS.CONVERT_TO_NUMBER(db_buffer_pages * 100.0 / ( SELECT cntr_value 
                                                                 FROM sys.dm_os_performance_counters 
                                                                  WHERE  RTRIM(object_name) LIKE '%Buffer Manager'
                                                                           AND counter_name = 'Database Pages' 
                                                                   FETCH FIRST 1 ROWS ONLY ),6,3) buffer_percent  ,
             read_time_ms ,
             modified_perc 
        FROM src
;
