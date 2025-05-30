--------------------------------------------------------
--  DDL for Index WRI$_SQLSET_STATEMENTS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRI$_SQLSET_STATEMENTS_PK" ON "SYS"."WRI$_SQLSET_STATEMENTS" ("ID", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
