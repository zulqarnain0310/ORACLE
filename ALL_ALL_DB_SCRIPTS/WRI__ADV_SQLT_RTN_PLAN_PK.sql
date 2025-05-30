--------------------------------------------------------
--  DDL for Index WRI$_ADV_SQLT_RTN_PLAN_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRI$_ADV_SQLT_RTN_PLAN_PK" ON "SYS"."WRI$_ADV_SQLT_RTN_PLAN" ("TASK_ID", "EXEC_NAME", "RTN_ID", "OBJECT_ID", "PLAN_ATTR", "OPERATION_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
