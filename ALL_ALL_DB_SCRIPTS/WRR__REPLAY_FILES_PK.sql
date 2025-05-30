--------------------------------------------------------
--  DDL for Index WRR$_REPLAY_FILES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRR$_REPLAY_FILES_PK" ON "SYS"."WRR$_REPLAY_FILES" ("CAP_FILE_ID", "SCHEDULE_CAP_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
