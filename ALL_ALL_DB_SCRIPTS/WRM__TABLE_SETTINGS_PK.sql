--------------------------------------------------------
--  DDL for Index WRM$_TABLE_SETTINGS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRM$_TABLE_SETTINGS_PK" ON "SYS"."WRM$_TABLE_SETTINGS" ("DBID", "TABLE_NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
