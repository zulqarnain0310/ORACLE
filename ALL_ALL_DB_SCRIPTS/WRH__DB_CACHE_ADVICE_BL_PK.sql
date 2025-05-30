--------------------------------------------------------
--  DDL for Index WRH$_DB_CACHE_ADVICE_BL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRH$_DB_CACHE_ADVICE_BL_PK" ON "SYS"."WRH$_DB_CACHE_ADVICE_BL" ("DBID", "SNAP_ID", "INSTANCE_NUMBER", "BPID", "BUFFERS_FOR_ESTIMATE", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
