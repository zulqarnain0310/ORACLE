--------------------------------------------------------
--  DDL for Index I_SCHEDULER_JOB_OUT_ARGS
--------------------------------------------------------

  CREATE INDEX "SYS"."I_SCHEDULER_JOB_OUT_ARGS" ON "SYS"."SCHEDULER$_JOB_OUT_ARGS" ("LOG_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
