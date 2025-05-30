--------------------------------------------------------
--  DDL for Index WRI$_ADV_SQLA_CV_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRI$_ADV_SQLA_CV_PK" ON "SYS"."WRI$_ADV_SQLA_COLVOL" ("TASK_ID", "TABLE#", "COL#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
