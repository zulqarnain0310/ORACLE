--------------------------------------------------------
--  DDL for Index WRH$_SQLTEXT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRH$_SQLTEXT_PK" ON "SYS"."WRH$_SQLTEXT" ("DBID", "SQL_ID", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
