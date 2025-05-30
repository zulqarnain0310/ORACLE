--------------------------------------------------------
--  DDL for Index WRH$_IM_SEG_STAT_OBJ_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRH$_IM_SEG_STAT_OBJ_PK" ON "SYS"."WRH$_IM_SEG_STAT_OBJ" ("DBID", "TS#", "OBJ#", "DATAOBJ#", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
