--------------------------------------------------------
--  DDL for View DB_QUERY_PLAN_EXEC_STATS_HISTORY
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "QPI_RBL_MISDB_PROD"."DB_QUERY_PLAN_EXEC_STATS_HISTORY" () AS 
  SELECT * 
     FROM db_query_plan_exec_stats_as_of(NULL)
;
