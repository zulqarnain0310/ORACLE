--------------------------------------------------------
--  DDL for Index WRH$_LIBRARYCACHE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRH$_LIBRARYCACHE_PK" ON "SYS"."WRH$_LIBRARYCACHE" ("DBID", "SNAP_ID", "INSTANCE_NUMBER", "NAMESPACE", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
