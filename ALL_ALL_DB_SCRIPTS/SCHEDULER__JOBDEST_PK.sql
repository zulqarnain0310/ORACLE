--------------------------------------------------------
--  DDL for Index SCHEDULER$_JOBDEST_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."SCHEDULER$_JOBDEST_PK" ON "SYS"."SCHEDULER$_JOB_DESTINATIONS" ("OID", "JOB_DEST_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
