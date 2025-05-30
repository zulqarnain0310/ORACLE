--------------------------------------------------------
--  DDL for Index WRI$_ADV_SQLW_TABLES_IDX_01
--------------------------------------------------------

  CREATE INDEX "SYS"."WRI$_ADV_SQLW_TABLES_IDX_01" ON "SYS"."WRI$_ADV_SQLW_TABLES" ("WORKLOAD_ID", "SQL_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
