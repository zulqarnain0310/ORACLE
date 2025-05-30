--------------------------------------------------------
--  DDL for Index I_PDBSVCSTATE1
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_PDBSVCSTATE1" ON "SYS"."PDB_SVC_STATE$" ("INST_NAME", "PDB_GUID", "SVC_HASH") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
