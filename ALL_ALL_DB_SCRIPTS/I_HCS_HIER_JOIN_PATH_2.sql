--------------------------------------------------------
--  DDL for Index I_HCS_HIER_JOIN_PATH_2
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_HCS_HIER_JOIN_PATH_2" ON "SYS"."HCS_HIER_JOIN_PATH$" ("HIER#", "ORDER_NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
