--------------------------------------------------------
--  DDL for Index WRM$_WR_USAGE_INDEX
--------------------------------------------------------

  CREATE INDEX "SYS"."WRM$_WR_USAGE_INDEX" ON "SYS"."WRM$_WR_USAGE" ("USAGE_TIME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
