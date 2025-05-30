--------------------------------------------------------
--  DDL for Index I_SCHEDULER_CONST_STAT1
--------------------------------------------------------

  CREATE INDEX "SYS"."I_SCHEDULER_CONST_STAT1" ON "SYS"."SCHEDULER$_CONSTRAINTS_STATS" ("RESOID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
