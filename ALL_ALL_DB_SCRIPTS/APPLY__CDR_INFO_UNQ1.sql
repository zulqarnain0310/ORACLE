--------------------------------------------------------
--  DDL for Index APPLY$_CDR_INFO_UNQ1
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."APPLY$_CDR_INFO_UNQ1" ON "SYS"."APPLY$_CDR_INFO" ("LOCAL_TRANSACTION_ID", "SEQ#", "RBA", "INDEX#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
