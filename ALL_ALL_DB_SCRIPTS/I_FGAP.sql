--------------------------------------------------------
--  DDL for Index I_FGAP
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_FGAP" ON "SYS"."FGA$" ("OBJ#", "PNAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
