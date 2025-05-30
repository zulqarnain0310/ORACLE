--------------------------------------------------------
--  DDL for Index TXN_BACKOUT_STATE_IDX3$
--------------------------------------------------------

  CREATE INDEX "SYS"."TXN_BACKOUT_STATE_IDX3$" ON "SYS"."TRANSACTION_BACKOUT_STATE$" ("USER#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
