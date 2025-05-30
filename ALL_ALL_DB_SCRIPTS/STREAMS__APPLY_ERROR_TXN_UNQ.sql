--------------------------------------------------------
--  DDL for Index STREAMS$_APPLY_ERROR_TXN_UNQ
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."STREAMS$_APPLY_ERROR_TXN_UNQ" ON "SYS"."APPLY$_ERROR_TXN" ("LOCAL_TRANSACTION_ID", "TXN_MESSAGE_NUMBER") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
