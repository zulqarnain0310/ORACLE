--------------------------------------------------------
--  DDL for Index APPLY$_SERVER_STATS_I
--------------------------------------------------------

  CREATE INDEX "SYS"."APPLY$_SERVER_STATS_I" ON "SYS"."APPLY$_SERVER_STATS" ("APPLY#", "SERVER_ID", "SAVE_TIME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
