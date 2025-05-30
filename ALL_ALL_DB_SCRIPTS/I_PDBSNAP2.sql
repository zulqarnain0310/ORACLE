--------------------------------------------------------
--  DDL for Index I_PDBSNAP2
--------------------------------------------------------

  CREATE INDEX "SYS"."I_PDBSNAP2" ON "SYS"."PDB_SNAPSHOT$" ("CON_UID", "SNAPNAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
