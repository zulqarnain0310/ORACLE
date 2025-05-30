--------------------------------------------------------
--  DDL for Index WRR$_CAPTURE_SCHEMA_INFO_IDX
--------------------------------------------------------

  CREATE INDEX "SYS"."WRR$_CAPTURE_SCHEMA_INFO_IDX" ON "SYS"."WRR$_CAPTURE_SCHEMA_INFO" ("CAPTURE_ID", "SQL_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
