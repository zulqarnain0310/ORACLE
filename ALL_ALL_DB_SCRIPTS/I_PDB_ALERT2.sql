--------------------------------------------------------
--  DDL for Index I_PDB_ALERT2
--------------------------------------------------------

  CREATE INDEX "SYS"."I_PDB_ALERT2" ON "SYS"."PDB_ALERT$" ("NAME", "CAUSE#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
