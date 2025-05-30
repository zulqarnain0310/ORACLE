--------------------------------------------------------
--  DDL for Index WRH$_PERSISTENT_QUEUES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRH$_PERSISTENT_QUEUES_PK" ON "SYS"."WRH$_PERSISTENT_QUEUES" ("DBID", "SNAP_ID", "INSTANCE_NUMBER", "QUEUE_SCHEMA", "QUEUE_ID", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
