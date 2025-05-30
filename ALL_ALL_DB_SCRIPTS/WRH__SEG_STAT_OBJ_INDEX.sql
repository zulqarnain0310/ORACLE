--------------------------------------------------------
--  DDL for Index WRH$_SEG_STAT_OBJ_INDEX
--------------------------------------------------------

  CREATE INDEX "SYS"."WRH$_SEG_STAT_OBJ_INDEX" ON "SYS"."WRH$_SEG_STAT_OBJ" ("DBID", "SNAP_ID", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
