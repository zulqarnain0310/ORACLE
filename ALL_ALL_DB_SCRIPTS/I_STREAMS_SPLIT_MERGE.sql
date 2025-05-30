--------------------------------------------------------
--  DDL for Index I_STREAMS_SPLIT_MERGE
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_STREAMS_SPLIT_MERGE" ON "SYS"."STREAMS$_SPLIT_MERGE" ("ORIGINAL_CAPTURE_NAME", "CLONED_CAPTURE_NAME", "JOB_NAME", "JOB_OWNER") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
