--------------------------------------------------------
--  DDL for Index I_STREAMS_STMT_HANDLERS
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_STREAMS_STMT_HANDLERS" ON "SYS"."STREAMS$_STMT_HANDLERS" ("HANDLER_NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
