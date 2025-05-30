--------------------------------------------------------
--  DDL for Index CMP_SCAN_VAL_UNIQ_IDX
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."CMP_SCAN_VAL_UNIQ_IDX" ON "SYS"."COMPARISON_SCAN_VAL$" ("COMPARISON_ID", "SCAN_ID", "COLUMN_POSITION") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
