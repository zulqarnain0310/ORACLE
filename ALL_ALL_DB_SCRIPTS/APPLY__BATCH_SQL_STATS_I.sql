--------------------------------------------------------
--  DDL for Index APPLY$_BATCH_SQL_STATS_I
--------------------------------------------------------

  CREATE INDEX "SYS"."APPLY$_BATCH_SQL_STATS_I" ON "SYS"."APPLY$_BATCH_SQL_STATS" ("APPLY#", "SERVER_ID", "SAVE_TIME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
