--------------------------------------------------------
--  DDL for Index I_SCHEDULER_CONST_STAT2
--------------------------------------------------------

  CREATE INDEX "SYS"."I_SCHEDULER_CONST_STAT2" ON "SYS"."SCHEDULER$_CONSTRAINTS_STATS" ("JOBOID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
