--------------------------------------------------------
--  DDL for Index WRH$_ROWCACHE_SUMMARY_BL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRH$_ROWCACHE_SUMMARY_BL_PK" ON "SYS"."WRH$_ROWCACHE_SUMMARY_BL" ("DBID", "SNAP_ID", "INSTANCE_NUMBER", "PARAMETER", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
