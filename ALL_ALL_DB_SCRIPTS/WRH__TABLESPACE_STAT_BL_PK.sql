--------------------------------------------------------
--  DDL for Index WRH$_TABLESPACE_STAT_BL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRH$_TABLESPACE_STAT_BL_PK" ON "SYS"."WRH$_TABLESPACE_STAT_BL" ("DBID", "SNAP_ID", "INSTANCE_NUMBER", "TS#", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
