--------------------------------------------------------
--  DDL for Index WRH$_COMP_IOSTAT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRH$_COMP_IOSTAT_PK" ON "SYS"."WRH$_COMP_IOSTAT" ("DBID", "SNAP_ID", "INSTANCE_NUMBER", "COMPONENT", "FILE_TYPE", "IO_TYPE", "OPERATION", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
