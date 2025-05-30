--------------------------------------------------------
--  DDL for Index IM_JOINGROUP_UK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."IM_JOINGROUP_UK" ON "SYS"."IM_JOINGROUP$" ("NAME", "OWNER#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
