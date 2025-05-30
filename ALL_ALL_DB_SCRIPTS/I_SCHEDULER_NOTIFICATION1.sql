--------------------------------------------------------
--  DDL for Index I_SCHEDULER_NOTIFICATION1
--------------------------------------------------------

  CREATE INDEX "SYS"."I_SCHEDULER_NOTIFICATION1" ON "SYS"."SCHEDULER$_NOTIFICATION" ("NOTIFICATION_OWNER", "OWNER", "JOB_NAME", "JOB_SUBNAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
