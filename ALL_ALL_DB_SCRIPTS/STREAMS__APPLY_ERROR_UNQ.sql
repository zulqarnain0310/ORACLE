--------------------------------------------------------
--  DDL for Index STREAMS$_APPLY_ERROR_UNQ
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."STREAMS$_APPLY_ERROR_UNQ" ON "SYS"."APPLY$_ERROR" ("LOCAL_TRANSACTION_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
