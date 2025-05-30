--------------------------------------------------------
--  DDL for Index WRR$_REPLAY_SQL_BINDS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRR$_REPLAY_SQL_BINDS_PK" ON "SYS"."WRR$_REPLAY_SQL_BINDS" ("CAPTURE_ID", "FILE_ID", "CALL_COUNTER", "ITERATION", "BIND_POS") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
