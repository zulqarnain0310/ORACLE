--------------------------------------------------------
--  DDL for Index I_EV2
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_EV2" ON "SYS"."EV$" ("BASE_TBL_OWNER#", "BASE_TBL_NAME", "EDITION_OBJ#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
