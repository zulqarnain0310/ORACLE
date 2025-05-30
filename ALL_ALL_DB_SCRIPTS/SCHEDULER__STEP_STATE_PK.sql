--------------------------------------------------------
--  DDL for Index SCHEDULER$_STEP_STATE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."SCHEDULER$_STEP_STATE_PK" ON "SYS"."SCHEDULER$_STEP_STATE" ("JOB_OID", "STEP_NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
