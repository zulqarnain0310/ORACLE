--------------------------------------------------------
--  DDL for Index I_LOCKDOWNPROF2
--------------------------------------------------------

  CREATE INDEX "SYS"."I_LOCKDOWNPROF2" ON "SYS"."LOCKDOWN_PROF$" ("PROF#", "RULETYP#", "RULEVAL") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
