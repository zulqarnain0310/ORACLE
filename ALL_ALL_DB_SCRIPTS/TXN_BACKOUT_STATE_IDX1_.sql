--------------------------------------------------------
--  DDL for Index TXN_BACKOUT_STATE_IDX1$
--------------------------------------------------------

  CREATE INDEX "SYS"."TXN_BACKOUT_STATE_IDX1$" ON "SYS"."TRANSACTION_BACKOUT_STATE$" ("COMPENSATING_XID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
