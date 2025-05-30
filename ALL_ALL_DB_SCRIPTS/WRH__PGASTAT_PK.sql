--------------------------------------------------------
--  DDL for Index WRH$_PGASTAT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRH$_PGASTAT_PK" ON "SYS"."WRH$_PGASTAT" ("DBID", "SNAP_ID", "INSTANCE_NUMBER", "NAME", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
