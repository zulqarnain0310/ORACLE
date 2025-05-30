--------------------------------------------------------
--  DDL for Index I_HCS_DIM_LVL_KEY_ATTR$_1
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_HCS_DIM_LVL_KEY_ATTR$_1" ON "SYS"."HCS_DIM_LVL_KEY_ATTR$" ("DIM#", "LVL#", "IS_PC", "LVL_KEY#", "ATTR#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
