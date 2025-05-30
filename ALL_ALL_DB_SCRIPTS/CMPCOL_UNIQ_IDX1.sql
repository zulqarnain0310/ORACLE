--------------------------------------------------------
--  DDL for Index CMPCOL_UNIQ_IDX1
--------------------------------------------------------

  CREATE INDEX "SYS"."CMPCOL_UNIQ_IDX1" ON "SYS"."COMPARISON_COL$" ("COMPARISON_ID", "COL_POSITION", "COL_NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
