--------------------------------------------------------
--  DDL for Index I_PDB_SPFILE_1
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_PDB_SPFILE_1" ON "SYS"."PDB_SPFILE$" ("DB_UNIQ_NAME", "PDB_UID", "SID", "NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
