--------------------------------------------------------
--  DDL for Index WRH$_DISPATCHER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRH$_DISPATCHER_PK" ON "SYS"."WRH$_DISPATCHER" ("DBID", "SNAP_ID", "INSTANCE_NUMBER", "NAME", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
