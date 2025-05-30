--------------------------------------------------------
--  DDL for Index TXN_BACKOUT_STATE_IDX2$
--------------------------------------------------------

  CREATE INDEX "SYS"."TXN_BACKOUT_STATE_IDX2$" ON "SYS"."TRANSACTION_BACKOUT_STATE$" ("XID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
