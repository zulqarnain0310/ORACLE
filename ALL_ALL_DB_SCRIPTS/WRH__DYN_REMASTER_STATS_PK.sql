--------------------------------------------------------
--  DDL for Index WRH$_DYN_REMASTER_STATS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRH$_DYN_REMASTER_STATS_PK" ON "SYS"."WRH$_DYN_REMASTER_STATS" ("DBID", "SNAP_ID", "INSTANCE_NUMBER", "CON_DBID", "REMASTER_TYPE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
