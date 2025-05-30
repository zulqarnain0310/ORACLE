--------------------------------------------------------
--  DDL for Index WRI$_SQLSET_BINDS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRI$_SQLSET_BINDS_PK" ON "SYS"."WRI$_SQLSET_BINDS" ("STMT_ID", "PLAN_HASH_VALUE", "POSITION", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
