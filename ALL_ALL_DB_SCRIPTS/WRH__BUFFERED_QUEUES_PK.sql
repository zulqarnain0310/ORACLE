--------------------------------------------------------
--  DDL for Index WRH$_BUFFERED_QUEUES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRH$_BUFFERED_QUEUES_PK" ON "SYS"."WRH$_BUFFERED_QUEUES" ("DBID", "SNAP_ID", "INSTANCE_NUMBER", "QUEUE_SCHEMA", "QUEUE_NAME", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
