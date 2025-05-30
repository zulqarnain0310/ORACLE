--------------------------------------------------------
--  DDL for Index WRH$_CELL_CONFIG_DETAIL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRH$_CELL_CONFIG_DETAIL_PK" ON "SYS"."WRH$_CELL_CONFIG_DETAIL" ("DBID", "SNAP_ID", "CELLHASH", "CONFTYPE", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
