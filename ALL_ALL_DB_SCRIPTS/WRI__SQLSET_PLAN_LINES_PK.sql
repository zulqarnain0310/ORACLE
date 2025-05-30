--------------------------------------------------------
--  DDL for Index WRI$_SQLSET_PLAN_LINES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRI$_SQLSET_PLAN_LINES_PK" ON "SYS"."WRI$_SQLSET_PLAN_LINES" ("STMT_ID", "PLAN_HASH_VALUE", "ID", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
