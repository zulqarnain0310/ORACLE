--------------------------------------------------------
--  DDL for Index SCHEDULER$_RDB_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."SCHEDULER$_RDB_PK" ON "SYS"."SCHEDULER$_REMOTE_DBS" ("DATABASE_NAME", "REG_STATUS") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
