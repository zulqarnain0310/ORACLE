--------------------------------------------------------
--  DDL for Index WRI$_ADV_SQLW_STMTS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRI$_ADV_SQLW_STMTS_PK" ON "SYS"."WRI$_ADV_SQLW_STMTS" ("WORKLOAD_ID", "SQL_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
