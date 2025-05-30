--------------------------------------------------------
--  DDL for Index WRH$_IOSTAT_FILETYPE_NAME_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRH$_IOSTAT_FILETYPE_NAME_PK" ON "SYS"."WRH$_IOSTAT_FILETYPE_NAME" ("DBID", "FILETYPE_ID", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
