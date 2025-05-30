--------------------------------------------------------
--  DDL for Index WRH$_ASM_DISKGROUP_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRH$_ASM_DISKGROUP_PK" ON "SYS"."WRH$_ASM_DISKGROUP" ("DBID", "GROUP_NUMBER", "NAME", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
