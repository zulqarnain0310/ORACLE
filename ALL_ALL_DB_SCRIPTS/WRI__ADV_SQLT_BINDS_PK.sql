--------------------------------------------------------
--  DDL for Index WRI$_ADV_SQLT_BINDS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRI$_ADV_SQLT_BINDS_PK" ON "SYS"."WRI$_ADV_SQLT_BINDS" ("TASK_ID", "OBJECT_ID", "POSITION") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
