--------------------------------------------------------
--  DDL for Index WRR$_REPLAY_TRACKED_COMMITS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRR$_REPLAY_TRACKED_COMMITS_PK" ON "SYS"."WRR$_REPLAY_TRACKED_COMMITS" ("REPLAY_DIR_NUMBER", "FILE_ID", "CALL_CTR") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
