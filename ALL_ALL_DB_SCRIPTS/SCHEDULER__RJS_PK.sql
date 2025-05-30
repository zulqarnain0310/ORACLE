--------------------------------------------------------
--  DDL for Index SCHEDULER$_RJS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."SCHEDULER$_RJS_PK" ON "SYS"."SCHEDULER$_REMOTE_JOB_STATE" ("JOBOID", "DESTINATION") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
