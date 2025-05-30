--------------------------------------------------------
--  DDL for Index WRH$_IOSTAT_FUNCTION_NAME_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRH$_IOSTAT_FUNCTION_NAME_PK" ON "SYS"."WRH$_IOSTAT_FUNCTION_NAME" ("DBID", "FUNCTION_ID", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
