--------------------------------------------------------
--  DDL for Index WRH$_CELL_OPEN_ALERTS_BL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRH$_CELL_OPEN_ALERTS_BL_PK" ON "SYS"."WRH$_CELL_OPEN_ALERTS_BL" ("DBID", "SNAP_ID", "BEGIN_TIME", "SEQ_NO", "CELL_HASH", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
