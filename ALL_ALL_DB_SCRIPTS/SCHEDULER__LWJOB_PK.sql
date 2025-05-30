--------------------------------------------------------
--  DDL for Index SCHEDULER$_LWJOB_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."SCHEDULER$_LWJOB_PK" ON "SYS"."SCHEDULER$_LIGHTWEIGHT_JOB" ("OBJ#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
