--------------------------------------------------------
--  DDL for Index CMP_SCAN_UNIQ_IDX
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."CMP_SCAN_UNIQ_IDX" ON "SYS"."COMPARISON_SCAN$" ("COMPARISON_ID", "SCAN_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
