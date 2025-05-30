--------------------------------------------------------
--  DDL for Index I_HCS_AV_LVL$_1
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_HCS_AV_LVL$_1" ON "SYS"."HCS_AV_LVL$" ("AV#", "AV_DIM#", "AV_HIER#", "LVL#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
