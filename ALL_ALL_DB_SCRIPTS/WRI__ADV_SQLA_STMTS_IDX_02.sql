--------------------------------------------------------
--  DDL for Index WRI$_ADV_SQLA_STMTS_IDX_02
--------------------------------------------------------

  CREATE INDEX "SYS"."WRI$_ADV_SQLA_STMTS_IDX_02" ON "SYS"."WRI$_ADV_SQLA_STMTS" ("TASK_ID", "VALIDATED") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
