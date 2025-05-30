--------------------------------------------------------
--  DDL for Index I_REPL$_PROCESS_EVENT
--------------------------------------------------------

  CREATE INDEX "SYS"."I_REPL$_PROCESS_EVENT" ON "SYS"."REPL$_PROCESS_EVENTS" ("STREAMS_NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
