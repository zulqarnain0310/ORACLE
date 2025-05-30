--------------------------------------------------------
--  DDL for Index WRH$_TABLESPACE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRH$_TABLESPACE_PK" ON "SYS"."WRH$_TABLESPACE" ("DBID", "TS#", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
