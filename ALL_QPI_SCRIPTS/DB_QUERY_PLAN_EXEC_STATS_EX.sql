--------------------------------------------------------
--  DDL for View DB_QUERY_PLAN_EXEC_STATS_EX
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "QPI_RBL_MISDB_PROD"."DB_QUERY_PLAN_EXEC_STATS_EX" () AS 
  SELECT * 
     FROM TABLE(db_query_plan_exec_stats_ex_as_of(SYS_EXTRACT_UTC(SYSTIMESTAMP)))
;
