--------------------------------------------------------
--  DDL for Index XS$PROXY_ROLE_UK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."XS$PROXY_ROLE_UK" ON "SYS"."XS$PROXY_ROLE" ("PROXY#", "CLIENT#", "ROLE#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
