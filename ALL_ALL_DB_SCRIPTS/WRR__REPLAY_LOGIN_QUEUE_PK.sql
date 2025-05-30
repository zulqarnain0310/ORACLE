--------------------------------------------------------
--  DDL for Index WRR$_REPLAY_LOGIN_QUEUE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRR$_REPLAY_LOGIN_QUEUE_PK" ON "SYS"."WRR$_REPLAY_LOGIN_QUEUE" ("CAP_FILE_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
