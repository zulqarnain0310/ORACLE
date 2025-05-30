--------------------------------------------------------
--  DDL for Index WRH$_SQL_BIND_METADATA_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRH$_SQL_BIND_METADATA_PK" ON "SYS"."WRH$_SQL_BIND_METADATA" ("DBID", "SQL_ID", "POSITION", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
