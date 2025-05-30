--------------------------------------------------------
--  DDL for Index WRH$_ASM_DISK_STAT_SUMM_BL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRH$_ASM_DISK_STAT_SUMM_BL_PK" ON "SYS"."WRH$_ASM_DISK_STAT_SUMMARY_BL" ("DBID", "SNAP_ID", "INSTANCE_NUMBER", "GROUP_NUMBER", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
