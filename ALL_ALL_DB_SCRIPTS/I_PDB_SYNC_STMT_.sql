--------------------------------------------------------
--  DDL for Index I_PDB_SYNC_STMT$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_PDB_SYNC_STMT$" ON "SYS"."PDB_SYNC_STMT$" ("APPID#", "SQLID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
