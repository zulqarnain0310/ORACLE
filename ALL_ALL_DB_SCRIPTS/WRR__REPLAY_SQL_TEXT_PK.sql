--------------------------------------------------------
--  DDL for Index WRR$_REPLAY_SQL_TEXT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRR$_REPLAY_SQL_TEXT_PK" ON "SYS"."WRR$_REPLAY_SQL_TEXT" ("SQL_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
