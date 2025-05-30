--------------------------------------------------------
--  DDL for Index WRH$_SYSTEM_EVENT_BL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRH$_SYSTEM_EVENT_BL_PK" ON "SYS"."WRH$_SYSTEM_EVENT_BL" ("DBID", "SNAP_ID", "INSTANCE_NUMBER", "EVENT_ID", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
