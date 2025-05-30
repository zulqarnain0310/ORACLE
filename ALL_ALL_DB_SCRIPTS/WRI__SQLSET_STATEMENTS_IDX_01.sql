--------------------------------------------------------
--  DDL for Index WRI$_SQLSET_STATEMENTS_IDX_01
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRI$_SQLSET_STATEMENTS_IDX_01" ON "SYS"."WRI$_SQLSET_STATEMENTS" ("SQLSET_ID", "SQL_ID", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
