--------------------------------------------------------
--  DDL for Index WRH$_BUFFER_POOL_STATS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRH$_BUFFER_POOL_STATS_PK" ON "SYS"."WRH$_BUFFER_POOL_STATISTICS" ("DBID", "SNAP_ID", "INSTANCE_NUMBER", "ID", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
