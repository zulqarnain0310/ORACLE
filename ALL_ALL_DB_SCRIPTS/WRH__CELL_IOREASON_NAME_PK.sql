--------------------------------------------------------
--  DDL for Index WRH$_CELL_IOREASON_NAME_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRH$_CELL_IOREASON_NAME_PK" ON "SYS"."WRH$_CELL_IOREASON_NAME" ("DBID", "REASON_ID", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
