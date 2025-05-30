--------------------------------------------------------
--  DDL for Index WRH$_IC_CLIENT_STATS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRH$_IC_CLIENT_STATS_PK" ON "SYS"."WRH$_IC_CLIENT_STATS" ("DBID", "SNAP_ID", "INSTANCE_NUMBER", "NAME", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
