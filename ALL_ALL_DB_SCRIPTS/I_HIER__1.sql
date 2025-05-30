--------------------------------------------------------
--  DDL for Index I_HIER$_1
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_HIER$_1" ON "SYS"."HIER$" ("DIMOBJ#", "HIERID#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
