--------------------------------------------------------
--  DDL for Index WRM$_COLORED_SQL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRM$_COLORED_SQL_PK" ON "SYS"."WRM$_COLORED_SQL" ("DBID", "SQL_ID", "OWNER") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
