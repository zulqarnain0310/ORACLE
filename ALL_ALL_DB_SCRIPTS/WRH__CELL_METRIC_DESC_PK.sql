--------------------------------------------------------
--  DDL for Index WRH$_CELL_METRIC_DESC_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRH$_CELL_METRIC_DESC_PK" ON "SYS"."WRH$_CELL_METRIC_DESC" ("DBID", "METRIC_ID", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
