--------------------------------------------------------
--  DDL for Index I_STREAMS_MESSAGE_CONSUMERS
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_STREAMS_MESSAGE_CONSUMERS" ON "SYS"."STREAMS$_MESSAGE_CONSUMERS" ("STREAMS_NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
