--------------------------------------------------------
--  DDL for Index WRR$_CAPTURE_FILES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRR$_CAPTURE_FILES_PK" ON "SYS"."WRR$_CAPTURE_FILES" ("CAPTURE_ID", "CAP_FILE_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
