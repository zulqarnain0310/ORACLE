--------------------------------------------------------
--  DDL for Index WRI$_ADV_ACTIONS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRI$_ADV_ACTIONS_PK" ON "SYS"."WRI$_ADV_ACTIONS" ("TASK_ID", "ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
