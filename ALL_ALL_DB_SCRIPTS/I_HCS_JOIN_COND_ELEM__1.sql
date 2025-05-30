--------------------------------------------------------
--  DDL for Index I_HCS_JOIN_COND_ELEM$_1
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_HCS_JOIN_COND_ELEM$_1" ON "SYS"."HCS_JOIN_COND_ELEM$" ("DIM#", "JOINPATH#", "ORDER_NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
