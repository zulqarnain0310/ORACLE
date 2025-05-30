--------------------------------------------------------
--  DDL for Index WRH$_IOSTAT_FILETYPE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRH$_IOSTAT_FILETYPE_PK" ON "SYS"."WRH$_IOSTAT_FILETYPE" ("DBID", "SNAP_ID", "INSTANCE_NUMBER", "FILETYPE_ID", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
