--------------------------------------------------------
--  DDL for Index WRH$_RECOVERY_PROGRESS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRH$_RECOVERY_PROGRESS_PK" ON "SYS"."WRH$_RECOVERY_PROGRESS" ("SNAP_ID", "DBID", "INSTANCE_NUMBER", "TYPE", "ITEM", "START_TIME", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
