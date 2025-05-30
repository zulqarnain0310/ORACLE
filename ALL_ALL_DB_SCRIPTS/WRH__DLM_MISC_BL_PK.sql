--------------------------------------------------------
--  DDL for Index WRH$_DLM_MISC_BL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRH$_DLM_MISC_BL_PK" ON "SYS"."WRH$_DLM_MISC_BL" ("DBID", "SNAP_ID", "INSTANCE_NUMBER", "STATISTIC#", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
