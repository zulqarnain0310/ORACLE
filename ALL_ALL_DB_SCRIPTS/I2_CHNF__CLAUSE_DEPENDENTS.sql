--------------------------------------------------------
--  DDL for Index I2_CHNF$_CLAUSE_DEPENDENTS
--------------------------------------------------------

  CREATE INDEX "SYS"."I2_CHNF$_CLAUSE_DEPENDENTS" ON "SYS"."CHNF$_CLAUSE_DEPENDENTS" ("CLAUSEID", "DEPENDENTID", "DEPENDENTTYPE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
