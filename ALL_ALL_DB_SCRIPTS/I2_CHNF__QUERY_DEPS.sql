--------------------------------------------------------
--  DDL for Index I2_CHNF$_QUERY_DEPS
--------------------------------------------------------

  CREATE INDEX "SYS"."I2_CHNF$_QUERY_DEPS" ON "SYS"."CHNF$_QUERY_DEPENDENCIES" ("PRIMARYTYPE", "PRIMARYID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
