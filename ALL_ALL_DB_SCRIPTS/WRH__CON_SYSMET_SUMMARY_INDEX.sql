--------------------------------------------------------
--  DDL for Index WRH$_CON_SYSMET_SUMMARY_INDEX
--------------------------------------------------------

  CREATE INDEX "SYS"."WRH$_CON_SYSMET_SUMMARY_INDEX" ON "SYS"."WRH$_CON_SYSMETRIC_SUMMARY" ("DBID", "SNAP_ID", "INSTANCE_NUMBER", "GROUP_ID", "METRIC_ID", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
