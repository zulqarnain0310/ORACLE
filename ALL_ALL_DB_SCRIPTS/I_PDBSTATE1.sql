--------------------------------------------------------
--  DDL for Index I_PDBSTATE1
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_PDBSTATE1" ON "SYS"."PDBSTATE$" ("INST_NAME", "PDB_GUID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
