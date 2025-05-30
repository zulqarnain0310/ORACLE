--------------------------------------------------------
--  DDL for Index I_DIMLEVEL$_1
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_DIMLEVEL$_1" ON "SYS"."DIMLEVEL$" ("DIMOBJ#", "LEVELID#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
