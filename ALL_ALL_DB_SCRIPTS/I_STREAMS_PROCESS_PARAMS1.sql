--------------------------------------------------------
--  DDL for Index I_STREAMS_PROCESS_PARAMS1
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_STREAMS_PROCESS_PARAMS1" ON "SYS"."STREAMS$_PROCESS_PARAMS" ("PROCESS_TYPE", "PROCESS#", "NAME", "SOURCE_DATABASE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
