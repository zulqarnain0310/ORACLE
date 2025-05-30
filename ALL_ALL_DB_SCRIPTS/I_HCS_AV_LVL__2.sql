--------------------------------------------------------
--  DDL for Index I_HCS_AV_LVL$_2
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_HCS_AV_LVL$_2" ON "SYS"."HCS_AV_LVL$" ("AV#", "AV_DIM#", "AV_HIER#", "ORDER_NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
