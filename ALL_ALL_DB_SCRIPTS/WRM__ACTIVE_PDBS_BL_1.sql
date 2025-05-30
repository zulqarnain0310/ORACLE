--------------------------------------------------------
--  DDL for Index WRM$_ACTIVE_PDBS_BL
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRM$_ACTIVE_PDBS_BL" ON "SYS"."WRM$_ACTIVE_PDBS_BL" ("DBID", "SNAP_ID", "INSTANCE_NUMBER", "PDBID", "CON_DBID", "TYPE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
