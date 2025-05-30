--------------------------------------------------------
--  DDL for Index WRH$_SQLSTAT_BL_INDEX
--------------------------------------------------------

  CREATE INDEX "SYS"."WRH$_SQLSTAT_BL_INDEX" ON "SYS"."WRH$_SQLSTAT_BL" ("SQL_ID", "DBID", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
