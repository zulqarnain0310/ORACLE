--------------------------------------------------------
--  DDL for Index WRH$_ENQUEUE_STAT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRH$_ENQUEUE_STAT_PK" ON "SYS"."WRH$_ENQUEUE_STAT" ("DBID", "SNAP_ID", "INSTANCE_NUMBER", "EQ_TYPE", "REQ_REASON", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
