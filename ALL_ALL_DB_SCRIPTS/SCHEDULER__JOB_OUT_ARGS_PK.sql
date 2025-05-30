--------------------------------------------------------
--  DDL for Index SCHEDULER$_JOB_OUT_ARGS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."SCHEDULER$_JOB_OUT_ARGS_PK" ON "SYS"."SCHEDULER$_JOB_OUT_ARGS" ("LOG_ID", "ARGUMENT_POSITION") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
