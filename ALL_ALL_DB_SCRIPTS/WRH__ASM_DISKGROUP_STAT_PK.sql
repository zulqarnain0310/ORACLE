--------------------------------------------------------
--  DDL for Index WRH$_ASM_DISKGROUP_STAT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRH$_ASM_DISKGROUP_STAT_PK" ON "SYS"."WRH$_ASM_DISKGROUP_STAT" ("SNAP_ID", "DBID", "GROUP_NUMBER", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
