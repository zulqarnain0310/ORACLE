--------------------------------------------------------
--  DDL for Index WRR$_REPLAY_SCHEDULES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRR$_REPLAY_SCHEDULES_PK" ON "SYS"."WRR$_REPLAY_SCHEDULES" ("SCHEDULE_NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
