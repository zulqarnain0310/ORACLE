--------------------------------------------------------
--  DDL for Index WRH$_THREAD_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRH$_THREAD_PK" ON "SYS"."WRH$_THREAD" ("DBID", "SNAP_ID", "INSTANCE_NUMBER", "THREAD#", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
