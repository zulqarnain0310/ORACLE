--------------------------------------------------------
--  DDL for Index I_RLS_SC
--------------------------------------------------------

  CREATE INDEX "SYS"."I_RLS_SC" ON "SYS"."RLS_SC$" ("OBJ#", "GNAME", "PNAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
