--------------------------------------------------------
--  DDL for Index I_HCS_LVL_ORD$_3
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_HCS_LVL_ORD$_3" ON "SYS"."HCS_LVL_ORD$" ("DIM#", "DIM_LVL#", "IS_PC", "ORDER_NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
