--------------------------------------------------------
--  DDL for Index WRR$_REPLAY_SQL_MAP_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRR$_REPLAY_SQL_MAP_PK" ON "SYS"."WRR$_REPLAY_SQL_MAP" ("REPLAY_ID", "SCHEDULE_CAP_ID", "SQL_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
