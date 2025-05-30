--------------------------------------------------------
--  DDL for Index WI$_CAPTURE_FILE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WI$_CAPTURE_FILE_PK" ON "SYS"."WI$_CAPTURE_FILE" ("JOBID", "FILEID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
