--------------------------------------------------------
--  DDL for View DB_QUERY_STATS_HISTORY
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "QPI_RBL_MISDB_PROD"."DB_QUERY_STATS_HISTORY" ("TEXT", "PARAMS", "EXECUTION_TYPE_DESC", "QUERY_ID", "COUNT_EXECUTIONS", "DURATION_S", "CPU_TIME_MS", "WAIT_TIME_MS", "LOG_BYTES_USED_KB", "LOGICAL_IO_READS_KB", "LOGICAL_IO_WRITES_KB", "PHYSICAL_IO_READS_KB", "CLR_TIME_MS", "START_TIME", "QUERY_HASH") AS 
  WITH ws AS ( SELECT query_id ,
                       start_time ,
                       execution_type_desc ,
                       SUM(wait_time_ms)  wait_time_ms  
     FROM qpi_RBL_MISDB_PROD.db_query_wait_stats_history 
     GROUP BY query_id,start_time,execution_type_desc ) 
      SELECT TEXT ,
             params ,
             qes.execution_type_desc ,
             qes.query_id ,
             count_executions ,
             duration_s ,
             cpu_time_ms ,
             wait_time_ms ,
             log_bytes_used_kb ,
             logical_io_reads_kb ,
             logical_io_writes_kb ,
             physical_io_reads_kb ,
             clr_time_ms ,
             qes.start_time ,
             qes.query_hash 
        FROM qpi_RBL_MISDB_PROD.db_query_exec_stats_history qes
               LEFT JOIN ws    ON qes.query_id = ws.query_id
               AND qes.start_time = ws.start_time
               AND qes.execution_type_desc = ws.execution_type_desc
;
