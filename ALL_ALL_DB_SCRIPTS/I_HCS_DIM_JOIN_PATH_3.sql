--------------------------------------------------------
--  DDL for Index I_HCS_DIM_JOIN_PATH_3
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_HCS_DIM_JOIN_PATH_3" ON "SYS"."HCS_DIM_JOIN_PATH$" ("DIM#", "ORDER_NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
