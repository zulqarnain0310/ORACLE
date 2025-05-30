--------------------------------------------------------
--  DDL for Index WRH$_SERVICE_NAME_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRH$_SERVICE_NAME_PK" ON "SYS"."WRH$_SERVICE_NAME" ("DBID", "SERVICE_NAME_HASH", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
