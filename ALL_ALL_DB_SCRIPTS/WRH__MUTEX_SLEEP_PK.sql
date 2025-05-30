--------------------------------------------------------
--  DDL for Index WRH$_MUTEX_SLEEP_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRH$_MUTEX_SLEEP_PK" ON "SYS"."WRH$_MUTEX_SLEEP" ("DBID", "SNAP_ID", "INSTANCE_NUMBER", "MUTEX_TYPE", "LOCATION", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
