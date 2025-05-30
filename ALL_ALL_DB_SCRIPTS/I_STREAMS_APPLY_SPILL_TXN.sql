--------------------------------------------------------
--  DDL for Index I_STREAMS_APPLY_SPILL_TXN
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_STREAMS_APPLY_SPILL_TXN" ON "SYS"."STREAMS$_APPLY_SPILL_TXN" ("APPLYNAME", "XIDUSN", "XIDSLT", "XIDSQN", "PDB_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
