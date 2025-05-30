--------------------------------------------------------
--  DDL for Index UQ_SNAPSHOT_TITLE
--------------------------------------------------------

  CREATE UNIQUE INDEX "QPI_RBL_MISDB_PROD"."UQ_SNAPSHOT_TITLE" ON "QPI_RBL_MISDB_PROD"."IO_VIRTUAL_FILE_STATS_SNAPSHOT" ("TITLE", "DATABASE_ID", "FILE_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
