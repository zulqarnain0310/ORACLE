--------------------------------------------------------
--  DDL for Index WRI$_ADV_SQLT_PLAN_HASH_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRI$_ADV_SQLT_PLAN_HASH_PK" ON "SYS"."WRI$_ADV_SQLT_PLAN_HASH" ("TASK_ID", "EXEC_NAME", "OBJECT_ID", "ATTRIBUTE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
