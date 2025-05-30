--------------------------------------------------------
--  DDL for Index WRH$_LMS_STATS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRH$_LMS_STATS_PK" ON "SYS"."WRH$_LMS_STATS" ("DBID", "SNAP_ID", "INSTANCE_NUMBER", "PID", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
