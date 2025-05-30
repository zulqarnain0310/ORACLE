--------------------------------------------------------
--  DDL for Index WRH$_INSTANCE_RECOVERY_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRH$_INSTANCE_RECOVERY_PK" ON "SYS"."WRH$_INSTANCE_RECOVERY" ("DBID", "SNAP_ID", "INSTANCE_NUMBER", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
