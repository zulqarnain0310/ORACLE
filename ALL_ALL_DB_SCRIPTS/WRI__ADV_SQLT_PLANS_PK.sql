--------------------------------------------------------
--  DDL for Index WRI$_ADV_SQLT_PLANS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRI$_ADV_SQLT_PLANS_PK" ON "SYS"."WRI$_ADV_SQLT_PLANS" ("PLAN_ID", "ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
