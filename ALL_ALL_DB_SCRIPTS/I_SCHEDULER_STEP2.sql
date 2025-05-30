--------------------------------------------------------
--  DDL for Index I_SCHEDULER_STEP2
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_SCHEDULER_STEP2" ON "SYS"."SCHEDULER$_STEP" ("OID", "VAR_NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
