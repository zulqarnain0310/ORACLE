--------------------------------------------------------
--  DDL for Index WRM$_SNAPSHOT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRM$_SNAPSHOT_PK" ON "SYS"."WRM$_SNAPSHOT" ("DBID", "SNAP_ID", "INSTANCE_NUMBER") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
