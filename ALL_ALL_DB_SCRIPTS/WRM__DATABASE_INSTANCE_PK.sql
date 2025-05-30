--------------------------------------------------------
--  DDL for Index WRM$_DATABASE_INSTANCE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRM$_DATABASE_INSTANCE_PK" ON "SYS"."WRM$_DATABASE_INSTANCE" ("DBID", "INSTANCE_NUMBER", "STARTUP_TIME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
