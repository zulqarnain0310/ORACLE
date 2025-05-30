--------------------------------------------------------
--  DDL for Index WRH$_IOSTAT_DETAIL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRH$_IOSTAT_DETAIL_PK" ON "SYS"."WRH$_IOSTAT_DETAIL" ("DBID", "SNAP_ID", "INSTANCE_NUMBER", "FUNCTION_ID", "FILETYPE_ID", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
