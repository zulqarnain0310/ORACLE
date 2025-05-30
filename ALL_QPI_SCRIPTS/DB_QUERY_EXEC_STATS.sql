--------------------------------------------------------
--  DDL for View DB_QUERY_EXEC_STATS
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "QPI_RBL_MISDB_PROD"."DB_QUERY_EXEC_STATS" () AS 
  SELECT * 
     FROM TABLE(db_query_exec_stats_as_of(SYS_EXTRACT_UTC(SYSTIMESTAMP)))
;
