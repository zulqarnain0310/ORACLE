--------------------------------------------------------
--  DDL for Index IM_DOMAIN_UK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."IM_DOMAIN_UK" ON "SYS"."IM_DOMAIN$" ("OBJN", "COL#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
