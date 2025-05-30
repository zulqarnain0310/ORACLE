--------------------------------------------------------
--  DDL for Index WRH$_ASH_BL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRH$_ASH_BL_PK" ON "SYS"."WRH$_ACTIVE_SESSION_HISTORY_BL" ("DBID", "SNAP_ID", "INSTANCE_NUMBER", "SAMPLE_ID", "SESSION_ID", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
