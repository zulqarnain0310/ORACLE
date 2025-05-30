--------------------------------------------------------
--  DDL for Index XS$ROLESET_ROLES_UK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."XS$ROLESET_ROLES_UK" ON "SYS"."XS$ROLESET_ROLES" ("RSID#", "ROLE#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
