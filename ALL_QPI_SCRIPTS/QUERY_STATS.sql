--------------------------------------------------------
--  DDL for View QUERY_STATS
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "QPI_RBL_MISDB_PROD"."QUERY_STATS" ("TEXT", "PARAMS", "QUERY_ID", "SESSION_ID", "REQUEST_ID", "MEMORY_MB", "START_TIME", "DURATION_S", "CPU_TIME_MS", "LOGICAL_IO_READS_KB", "LOGICAL_IO_WRITES_KB", "PHYSICAL_IO_READS_KB", "CLR_TIME_MS", "GRANTED_MB", "USED_MB", "IDEAL_MB") AS 
  SELECT Q.TEXT ,
          Q.params ,
          Q.query_id ,
          Q.session_id ,
          Q.request_id ,
          Q.memory_mb ,
          Q.start_time ,
          UTILS.CONVERT_TO_NUMBER(utils.round_(rs.total_elapsed_time / execution_count / 1000.0 / 1000.0, 2),12,2) duration_s  ,
          UTILS.CONVERT_TO_NUMBER(utils.round_(rs.total_worker_time / execution_count, 1),12,1) cpu_time_ms  ,
          UTILS.CONVERT_TO_NUMBER(utils.round_(rs.total_logical_reads / execution_count * 8 / 1000.0, 2),12,2) logical_io_reads_kb  ,
          UTILS.CONVERT_TO_NUMBER(utils.round_(rs.total_logical_writes / execution_count * 8 / 1000.0, 2),12,2) logical_io_writes_kb  ,
          UTILS.CONVERT_TO_NUMBER(utils.round_(rs.total_physical_reads / execution_count * 8 / 1000.0, 2),12,2) physical_io_reads_kb  ,
          UTILS.CONVERT_TO_NUMBER(utils.round_(rs.total_clr_time / execution_count / 1000.0, 1),12,1) clr_time_ms  ,
          rs.total_grant_kb / execution_count / 1024 granted_mb  ,
          rs.total_used_grant_kb / execution_count / 1024 used_mb  ,
          rs.total_ideal_grant_kb / execution_count / 1024 ideal_mb  
     FROM qpi_RBL_MISDB_PROD.queries Q
            LEFT JOIN sys.dm_exec_query_stats rs   ON Q.sql_handle = rs.sql_handle
;
