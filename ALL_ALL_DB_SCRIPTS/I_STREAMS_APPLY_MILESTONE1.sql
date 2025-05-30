--------------------------------------------------------
--  DDL for Index I_STREAMS_APPLY_MILESTONE1
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_STREAMS_APPLY_MILESTONE1" ON "SYS"."STREAMS$_APPLY_MILESTONE" ("APPLY#", "SOURCE_DB_NAME", "SOURCE_ROOT_NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
