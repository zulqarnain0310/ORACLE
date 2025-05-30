--------------------------------------------------------
--  DDL for Index I_HCS_DIM_JOIN_PATH_2
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_HCS_DIM_JOIN_PATH_2" ON "SYS"."HCS_DIM_JOIN_PATH$" ("DIM#", "JOIN_PATH_NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
