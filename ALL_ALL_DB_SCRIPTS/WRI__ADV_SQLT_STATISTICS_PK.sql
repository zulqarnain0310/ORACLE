--------------------------------------------------------
--  DDL for Index WRI$_ADV_SQLT_STATISTICS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRI$_ADV_SQLT_STATISTICS_PK" ON "SYS"."WRI$_ADV_SQLT_STATISTICS" ("TASK_ID", "OBJECT_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
