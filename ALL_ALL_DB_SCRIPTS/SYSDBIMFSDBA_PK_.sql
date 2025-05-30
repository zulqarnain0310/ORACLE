--------------------------------------------------------
--  DDL for Index SYSDBIMFSDBA_PK$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."SYSDBIMFSDBA_PK$" ON "SYS"."SYSDBIMFSDBA$" ("SEGID", "BASEDBA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
