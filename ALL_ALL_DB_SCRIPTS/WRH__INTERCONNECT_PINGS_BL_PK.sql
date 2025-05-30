--------------------------------------------------------
--  DDL for Index WRH$_INTERCONNECT_PINGS_BL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRH$_INTERCONNECT_PINGS_BL_PK" ON "SYS"."WRH$_INTERCONNECT_PINGS_BL" ("DBID", "SNAP_ID", "INSTANCE_NUMBER", "TARGET_INSTANCE", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
