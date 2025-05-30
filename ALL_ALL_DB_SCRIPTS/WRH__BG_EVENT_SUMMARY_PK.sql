--------------------------------------------------------
--  DDL for Index WRH$_BG_EVENT_SUMMARY_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRH$_BG_EVENT_SUMMARY_PK" ON "SYS"."WRH$_BG_EVENT_SUMMARY" ("DBID", "SNAP_ID", "INSTANCE_NUMBER", "EVENT_ID", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
