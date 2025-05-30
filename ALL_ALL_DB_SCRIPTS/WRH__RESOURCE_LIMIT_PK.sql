--------------------------------------------------------
--  DDL for Index WRH$_RESOURCE_LIMIT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRH$_RESOURCE_LIMIT_PK" ON "SYS"."WRH$_RESOURCE_LIMIT" ("DBID", "SNAP_ID", "INSTANCE_NUMBER", "RESOURCE_NAME", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
