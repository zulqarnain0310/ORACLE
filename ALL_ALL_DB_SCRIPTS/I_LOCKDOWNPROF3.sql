--------------------------------------------------------
--  DDL for Index I_LOCKDOWNPROF3
--------------------------------------------------------

  CREATE INDEX "SYS"."I_LOCKDOWNPROF3" ON "SYS"."LOCKDOWN_PROF$" ("PROF#", "RULETYP#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
