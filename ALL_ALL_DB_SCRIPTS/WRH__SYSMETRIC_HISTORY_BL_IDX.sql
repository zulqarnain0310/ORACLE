--------------------------------------------------------
--  DDL for Index WRH$_SYSMETRIC_HISTORY_BL_IDX
--------------------------------------------------------

  CREATE INDEX "SYS"."WRH$_SYSMETRIC_HISTORY_BL_IDX" ON "SYS"."WRH$_SYSMETRIC_HISTORY_BL" ("DBID", "SNAP_ID", "INSTANCE_NUMBER", "GROUP_ID", "METRIC_ID", "BEGIN_TIME", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
