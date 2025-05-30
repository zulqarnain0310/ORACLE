--------------------------------------------------------
--  DDL for Index WRI$_SQLTEXT_REFCOUNT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRI$_SQLTEXT_REFCOUNT_PK" ON "SYS"."WRI$_SQLTEXT_REFCOUNT" ("DBID", "SQL_ID", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
