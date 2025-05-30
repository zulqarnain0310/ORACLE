--------------------------------------------------------
--  DDL for Index XS$ROLE_GRANT_UK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."XS$ROLE_GRANT_UK" ON "SYS"."XS$ROLE_GRANT" ("GRANTEE#", "ROLE#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
