--------------------------------------------------------
--  DDL for Index WRH$_SERVICE_STAT_BL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRH$_SERVICE_STAT_BL_PK" ON "SYS"."WRH$_SERVICE_STAT_BL" ("DBID", "SNAP_ID", "INSTANCE_NUMBER", "SERVICE_NAME_HASH", "STAT_ID", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
