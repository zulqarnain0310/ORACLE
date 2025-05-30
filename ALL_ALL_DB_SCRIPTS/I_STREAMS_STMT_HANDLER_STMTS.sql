--------------------------------------------------------
--  DDL for Index I_STREAMS_STMT_HANDLER_STMTS
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_STREAMS_STMT_HANDLER_STMTS" ON "SYS"."STREAMS$_STMT_HANDLER_STMTS" ("HANDLER_ID", "EXECUTION_SEQUENCE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
