--------------------------------------------------------
--  DDL for Index WRM$_PDB_INSTANCE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRM$_PDB_INSTANCE_PK" ON "SYS"."WRM$_PDB_INSTANCE" ("DBID", "INSTANCE_NUMBER", "STARTUP_TIME", "CON_DBID", "OPEN_TIME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
