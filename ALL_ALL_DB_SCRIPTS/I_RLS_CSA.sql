--------------------------------------------------------
--  DDL for Index I_RLS_CSA
--------------------------------------------------------

  CREATE INDEX "SYS"."I_RLS_CSA" ON "SYS"."RLS_CSA$" ("OBJ#", "GNAME", "PNAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
