--------------------------------------------------------
--  DDL for Index I_LOCKDOWNPROF1
--------------------------------------------------------

  CREATE INDEX "SYS"."I_LOCKDOWNPROF1" ON "SYS"."LOCKDOWN_PROF$" ("PROF#", "RULETYP#", "RULEVAL", "CLAUSE", "OPTION$") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
