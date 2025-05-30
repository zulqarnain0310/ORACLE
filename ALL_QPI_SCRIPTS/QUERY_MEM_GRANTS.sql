--------------------------------------------------------
--  DDL for View QUERY_MEM_GRANTS
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "QPI_RBL_MISDB_PROD"."QUERY_MEM_GRANTS" ("TEXT", "PARAMS", "QUERY_ID", "SESSION_ID", "REQUEST_ID", "MEMORY_MB", "START_TIME", "REQUIRED_MB", "REQUESTED_MB", "GRANTED_MB", "USED_MB", "MAX_USED_MB", "IDEAL_MB", "TIMEOUT_S", "WAIT_TIME_MS", "IS_NEXT_CANDIDATE") AS 
  SELECT Q.TEXT ,
          Q.params ,
          Q.query_id ,
          Q.session_id ,
          Q.request_id ,
          Q.memory_mb ,
          Q.start_time ,
          mg.required_memory_kb / 1024 required_mb  ,
          mg.requested_memory_kb / 1024 requested_mb  ,
          mg.granted_memory_kb / 1024 granted_mb  ,
          mg.used_memory_kb / 1024 used_mb  ,
          mg.max_used_memory_kb / 1024 max_used_mb  ,
          mg.ideal_memory_kb / 1024 ideal_mb  ,
          mg.timeout_sec timeout_s  ,
          mg.wait_time_ms ,
          mg.is_next_candidate 
     FROM qpi_RBL_MISDB_PROD.queries Q
            LEFT JOIN sys.dm_exec_query_memory_grants mg   ON Q.session_id = mg.session_id
            AND Q.request_id = mg.request_id
;
