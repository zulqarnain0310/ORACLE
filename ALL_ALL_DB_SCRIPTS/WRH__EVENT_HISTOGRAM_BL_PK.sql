--------------------------------------------------------
--  DDL for Index WRH$_EVENT_HISTOGRAM_BL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRH$_EVENT_HISTOGRAM_BL_PK" ON "SYS"."WRH$_EVENT_HISTOGRAM_BL" ("DBID", "SNAP_ID", "INSTANCE_NUMBER", "EVENT_ID", "WAIT_TIME_MILLI", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
