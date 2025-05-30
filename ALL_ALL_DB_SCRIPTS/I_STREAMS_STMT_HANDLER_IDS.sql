--------------------------------------------------------
--  DDL for Index I_STREAMS_STMT_HANDLER_IDS
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_STREAMS_STMT_HANDLER_IDS" ON "SYS"."STREAMS$_STMT_HANDLERS" ("HANDLER_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
