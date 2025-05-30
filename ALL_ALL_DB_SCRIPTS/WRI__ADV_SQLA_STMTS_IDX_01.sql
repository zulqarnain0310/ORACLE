--------------------------------------------------------
--  DDL for Index WRI$_ADV_SQLA_STMTS_IDX_01
--------------------------------------------------------

  CREATE INDEX "SYS"."WRI$_ADV_SQLA_STMTS_IDX_01" ON "SYS"."WRI$_ADV_SQLA_STMTS" ("TASK_ID", "WORKLOAD_ID", "SQL_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
