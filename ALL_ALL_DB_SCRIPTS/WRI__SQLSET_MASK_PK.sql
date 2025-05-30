--------------------------------------------------------
--  DDL for Index WRI$_SQLSET_MASK_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRI$_SQLSET_MASK_PK" ON "SYS"."WRI$_SQLSET_MASK" ("STMT_ID", "PLAN_HASH_VALUE", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
