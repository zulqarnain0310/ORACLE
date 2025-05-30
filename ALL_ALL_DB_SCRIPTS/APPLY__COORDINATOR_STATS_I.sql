--------------------------------------------------------
--  DDL for Index APPLY$_COORDINATOR_STATS_I
--------------------------------------------------------

  CREATE INDEX "SYS"."APPLY$_COORDINATOR_STATS_I" ON "SYS"."APPLY$_COORDINATOR_STATS" ("APPLY#", "SAVE_TIME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
