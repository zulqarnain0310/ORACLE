--------------------------------------------------------
--  DDL for Index CMP_ROW_DIF_UNIQ_IDX_1
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."CMP_ROW_DIF_UNIQ_IDX_1" ON "SYS"."COMPARISON_ROW_DIF$" ("COMPARISON_ID", "SCAN_ID", "LOC_ROWID", "RMT_ROWID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
