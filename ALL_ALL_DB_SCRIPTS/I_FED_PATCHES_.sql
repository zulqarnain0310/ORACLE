--------------------------------------------------------
--  DDL for Index I_FED_PATCHES$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_FED_PATCHES$" ON "SYS"."FED$PATCHES" ("APPID#", "PATCH#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
