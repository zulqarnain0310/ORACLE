--------------------------------------------------------
--  DDL for Index WRH$_PARAMETER_NAME_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRH$_PARAMETER_NAME_PK" ON "SYS"."WRH$_PARAMETER_NAME" ("DBID", "PARAMETER_HASH", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
