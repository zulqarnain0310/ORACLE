--------------------------------------------------------
--  DDL for Index I_PDB_ALERT1
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_PDB_ALERT1" ON "SYS"."PDB_ALERT$" ("NAME", "CAUSE#", "TYPE#", "LINE#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
