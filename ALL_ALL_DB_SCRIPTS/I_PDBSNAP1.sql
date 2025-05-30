--------------------------------------------------------
--  DDL for Index I_PDBSNAP1
--------------------------------------------------------

  CREATE INDEX "SYS"."I_PDBSNAP1" ON "SYS"."PDB_SNAPSHOT$" ("CON_UID", "SNAPSCN") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
