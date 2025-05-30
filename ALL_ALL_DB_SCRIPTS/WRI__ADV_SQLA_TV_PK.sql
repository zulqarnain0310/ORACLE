--------------------------------------------------------
--  DDL for Index WRI$_ADV_SQLA_TV_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRI$_ADV_SQLA_TV_PK" ON "SYS"."WRI$_ADV_SQLA_TABVOL" ("TASK_ID", "TABLE#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
