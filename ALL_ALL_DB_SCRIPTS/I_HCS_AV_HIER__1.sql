--------------------------------------------------------
--  DDL for Index I_HCS_AV_HIER$_1
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_HCS_AV_HIER$_1" ON "SYS"."HCS_AV_HIER$" ("AV#", "AV_DIM#", "HIER#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
