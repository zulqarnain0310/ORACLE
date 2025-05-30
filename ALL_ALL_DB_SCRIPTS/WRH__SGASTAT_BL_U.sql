--------------------------------------------------------
--  DDL for Index WRH$_SGASTAT_BL_U
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRH$_SGASTAT_BL_U" ON "SYS"."WRH$_SGASTAT_BL" ("DBID", "SNAP_ID", "INSTANCE_NUMBER", "NAME", "POOL", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
