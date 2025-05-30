--------------------------------------------------------
--  DDL for Index I_STREAMS_APPLY_SPILL_MESGS1
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_STREAMS_APPLY_SPILL_MESGS1" ON "SYS"."STREAMS$_APPLY_SPILL_MESSAGES" ("TXNKEY", "SEQUENCE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
