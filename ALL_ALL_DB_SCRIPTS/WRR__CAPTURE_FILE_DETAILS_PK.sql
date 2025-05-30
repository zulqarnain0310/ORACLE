--------------------------------------------------------
--  DDL for Index WRR$_CAPTURE_FILE_DETAILS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRR$_CAPTURE_FILE_DETAILS_PK" ON "SYS"."WRR$_CAPTURE_FILE_DETAILS" ("CAP_FILE_ID", "OBJECT_ID", "ACTION_CODE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
