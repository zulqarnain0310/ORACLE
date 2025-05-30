--------------------------------------------------------
--  DDL for Index WRR$_REPLAY_CALL_FILTER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRR$_REPLAY_CALL_FILTER_PK" ON "SYS"."WRR$_REPLAY_CALL_FILTER" ("FILE_ID", "CALL_COUNTER_BEGIN", "CALL_COUNTER_END") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
