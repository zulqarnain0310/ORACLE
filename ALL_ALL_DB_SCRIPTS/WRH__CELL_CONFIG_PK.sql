--------------------------------------------------------
--  DDL for Index WRH$_CELL_CONFIG_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRH$_CELL_CONFIG_PK" ON "SYS"."WRH$_CELL_CONFIG" ("DBID", "CELLHASH", "CONFTYPE", "CONFVAL_HASH", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
