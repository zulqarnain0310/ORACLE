--------------------------------------------------------
--  DDL for Index WRH$_PERSISTENT_QMN_CACHE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRH$_PERSISTENT_QMN_CACHE_PK" ON "SYS"."WRH$_PERSISTENT_QMN_CACHE" ("DBID", "SNAP_ID", "INSTANCE_NUMBER", "QUEUE_TABLE_ID", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
