--------------------------------------------------------
--  DDL for Index IX_DM_OS_WAIT_STATS_SNAPSHOT
--------------------------------------------------------

  CREATE INDEX "QPI_RBL_MISDB_PROD"."IX_DM_OS_WAIT_STATS_SNAPSHOT" ON "QPI_RBL_MISDB_PROD"."OS_WAIT_STATS_SNAPSHOT_HISTORY" ("END_TIME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
