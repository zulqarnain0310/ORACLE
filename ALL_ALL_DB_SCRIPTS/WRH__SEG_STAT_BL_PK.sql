--------------------------------------------------------
--  DDL for Index WRH$_SEG_STAT_BL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRH$_SEG_STAT_BL_PK" ON "SYS"."WRH$_SEG_STAT_BL" ("DBID", "SNAP_ID", "INSTANCE_NUMBER", "TS#", "OBJ#", "DATAOBJ#", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
