--------------------------------------------------------
--  DDL for Index WRH$_TOPLEVELCALL_NAME_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRH$_TOPLEVELCALL_NAME_PK" ON "SYS"."WRH$_TOPLEVELCALL_NAME" ("DBID", "TOP_LEVEL_CALL#", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
