--------------------------------------------------------
--  DDL for Index WRH$_CELL_GLOBAL_SUMMARY_BL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRH$_CELL_GLOBAL_SUMMARY_BL_PK" ON "SYS"."WRH$_CELL_GLOBAL_SUMMARY_BL" ("DBID", "SNAP_ID", "CELL_HASH", "INCARNATION_NUM", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
