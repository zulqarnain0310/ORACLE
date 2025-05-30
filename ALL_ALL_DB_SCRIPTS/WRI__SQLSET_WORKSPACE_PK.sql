--------------------------------------------------------
--  DDL for Index WRI$_SQLSET_WORKSPACE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRI$_SQLSET_WORKSPACE_PK" ON "SYS"."WRI$_SQLSET_WORKSPACE" ("WORKSPACE_NAME", "SQLSET_NAME", "SQL_ID", "PLAN_HASH_VALUE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
