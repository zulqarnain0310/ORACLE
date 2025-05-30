--------------------------------------------------------
--  DDL for Index WRH$_SESSMETRIC_HISTORY_INDEX
--------------------------------------------------------

  CREATE INDEX "SYS"."WRH$_SESSMETRIC_HISTORY_INDEX" ON "SYS"."WRH$_SESSMETRIC_HISTORY" ("DBID", "SNAP_ID", "INSTANCE_NUMBER", "GROUP_ID", "SESSID", "METRIC_ID", "BEGIN_TIME", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
