--------------------------------------------------------
--  DDL for Index SYSDBIMFSSEG_IDX$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."SYSDBIMFSSEG_IDX$" ON "SYS"."SYSDBIMFSSEG$" ("PDB", "TSN", "OBJD", "VERSION") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
