--------------------------------------------------------
--  DDL for Index WRH$_CELL_DB_BL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRH$_CELL_DB_BL_PK" ON "SYS"."WRH$_CELL_DB_BL" ("DBID", "SNAP_ID", "SRC_DBID", "CELL_HASH", "INCARNATION_NUM", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
