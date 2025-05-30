--------------------------------------------------------
--  DDL for View DB_QUERY_PLAN_WAIT_STATS
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "QPI_RBL_MISDB_PROD"."DB_QUERY_PLAN_WAIT_STATS" () AS 
  SELECT * 
     FROM TABLE(db_query_plan_wait_stats_as_of(SYS_EXTRACT_UTC(SYSTIMESTAMP)))
;
