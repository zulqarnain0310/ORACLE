--------------------------------------------------------
--  DDL for Index WRH$_RSRC_CONSUMER_GROUP_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRH$_RSRC_CONSUMER_GROUP_PK" ON "SYS"."WRH$_RSRC_CONSUMER_GROUP" ("DBID", "SNAP_ID", "INSTANCE_NUMBER", "SEQUENCE#", "CONSUMER_GROUP_ID", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
