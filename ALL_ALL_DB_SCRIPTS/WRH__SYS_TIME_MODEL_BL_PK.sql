--------------------------------------------------------
--  DDL for Index WRH$_SYS_TIME_MODEL_BL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRH$_SYS_TIME_MODEL_BL_PK" ON "SYS"."WRH$_SYS_TIME_MODEL_BL" ("DBID", "SNAP_ID", "INSTANCE_NUMBER", "STAT_ID", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
