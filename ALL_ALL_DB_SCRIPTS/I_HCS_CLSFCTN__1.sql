--------------------------------------------------------
--  DDL for Index I_HCS_CLSFCTN$_1
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_HCS_CLSFCTN$_1" ON "SYS"."HCS_CLSFCTN$" ("OBJ#", "SUB_OBJ#", "OBJ_TYPE", "CLSFCTION_NAME", "CLSFCTION_LANG") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
