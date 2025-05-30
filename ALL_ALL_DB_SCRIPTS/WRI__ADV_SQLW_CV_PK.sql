--------------------------------------------------------
--  DDL for Index WRI$_ADV_SQLW_CV_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRI$_ADV_SQLW_CV_PK" ON "SYS"."WRI$_ADV_SQLW_COLVOL" ("WORKLOAD_ID", "TABLE#", "COL#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
