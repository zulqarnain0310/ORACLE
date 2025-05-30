--------------------------------------------------------
--  DDL for Index WRR$_CAPTURE_LONG_SQLTEXT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRR$_CAPTURE_LONG_SQLTEXT_PK" ON "SYS"."WRR$_CAPTURE_LONG_SQLTEXT" ("CAPTURE_ID", "SQL_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
