--------------------------------------------------------
--  DDL for Index WRI$_SQLSET_WORKSPACE_PLANS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRI$_SQLSET_WORKSPACE_PLANS_PK" ON "SYS"."WRI$_SQLSET_WORKSPACE_PLANS" ("PLAN_ID", "ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
