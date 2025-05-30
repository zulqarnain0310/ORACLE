--------------------------------------------------------
--  DDL for Index WRM$_BASELINE_TEMPLATE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRM$_BASELINE_TEMPLATE_PK" ON "SYS"."WRM$_BASELINE_TEMPLATE" ("DBID", "TEMPLATE_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
