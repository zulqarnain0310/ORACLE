--------------------------------------------------------
--  DDL for Index WRH$_SQLCOMMAND_NAME_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRH$_SQLCOMMAND_NAME_PK" ON "SYS"."WRH$_SQLCOMMAND_NAME" ("DBID", "COMMAND_TYPE", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
