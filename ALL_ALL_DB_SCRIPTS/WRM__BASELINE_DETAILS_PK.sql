--------------------------------------------------------
--  DDL for Index WRM$_BASELINE_DETAILS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRM$_BASELINE_DETAILS_PK" ON "SYS"."WRM$_BASELINE_DETAILS" ("DBID", "BASELINE_ID", "INSTANCE_NUMBER") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
