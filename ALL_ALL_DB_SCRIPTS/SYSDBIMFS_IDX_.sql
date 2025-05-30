--------------------------------------------------------
--  DDL for Index SYSDBIMFS_IDX$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."SYSDBIMFS_IDX$" ON "SYS"."SYSDBIMFS$" ("SEGID", "STARTDBA", "VERSION") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
