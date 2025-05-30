--------------------------------------------------------
--  DDL for Index I_INCEXP
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_INCEXP" ON "SYS"."INCEXP" ("OWNER#", "NAME", "TYPE#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
