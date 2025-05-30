--------------------------------------------------------
--  DDL for Index WRH$_LOG_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRH$_LOG_PK" ON "SYS"."WRH$_LOG" ("DBID", "SNAP_ID", "INSTANCE_NUMBER", "GROUP#", "THREAD#", "SEQUENCE#", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
