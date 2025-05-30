--------------------------------------------------------
--  DDL for Index WRH$_SQL_WORKAREA_HIST_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRH$_SQL_WORKAREA_HIST_PK" ON "SYS"."WRH$_SQL_WORKAREA_HISTOGRAM" ("DBID", "SNAP_ID", "INSTANCE_NUMBER", "LOW_OPTIMAL_SIZE", "HIGH_OPTIMAL_SIZE", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
