--------------------------------------------------------
--  DDL for Index WRM$_PDB_IN_SNAP_BL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRM$_PDB_IN_SNAP_BL_PK" ON "SYS"."WRM$_PDB_IN_SNAP_BL" ("DBID", "SNAP_ID", "INSTANCE_NUMBER", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
