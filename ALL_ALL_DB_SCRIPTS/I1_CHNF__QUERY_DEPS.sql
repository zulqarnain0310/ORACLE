--------------------------------------------------------
--  DDL for Index I1_CHNF$_QUERY_DEPS
--------------------------------------------------------

  CREATE INDEX "SYS"."I1_CHNF$_QUERY_DEPS" ON "SYS"."CHNF$_QUERY_DEPENDENCIES" ("DEPENDENCYTYPE", "DEPENDENTNAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
