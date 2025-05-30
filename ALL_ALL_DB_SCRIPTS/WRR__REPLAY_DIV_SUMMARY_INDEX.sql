--------------------------------------------------------
--  DDL for Index WRR$_REPLAY_DIV_SUMMARY_INDEX
--------------------------------------------------------

  CREATE INDEX "SYS"."WRR$_REPLAY_DIV_SUMMARY_INDEX" ON "SYS"."WRR$_REPLAY_DIV_SUMMARY" ("FILE_ID", "REPLAY_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
