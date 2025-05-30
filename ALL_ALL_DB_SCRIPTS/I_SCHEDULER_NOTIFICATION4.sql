--------------------------------------------------------
--  DDL for Index I_SCHEDULER_NOTIFICATION4
--------------------------------------------------------

  CREATE INDEX "SYS"."I_SCHEDULER_NOTIFICATION4" ON "SYS"."SCHEDULER$_NOTIFICATION" ("OWNER", "JOB_NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
