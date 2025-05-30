--------------------------------------------------------
--  DDL for Index WRI$_ADV_REC_ACTIONS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRI$_ADV_REC_ACTIONS_PK" ON "SYS"."WRI$_ADV_REC_ACTIONS" ("TASK_ID", "REC_ID", "ACT_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
