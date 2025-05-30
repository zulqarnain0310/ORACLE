--------------------------------------------------------
--  DDL for Index WRI$_ADV_SQLT_PLAN_HASH_01
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRI$_ADV_SQLT_PLAN_HASH_01" ON "SYS"."WRI$_ADV_SQLT_PLAN_HASH" ("TASK_ID", "EXEC_NAME", "SQL_ID", "PLAN_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
