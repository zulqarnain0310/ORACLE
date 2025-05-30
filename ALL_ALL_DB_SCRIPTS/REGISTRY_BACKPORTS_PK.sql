--------------------------------------------------------
--  DDL for Index REGISTRY_BACKPORTS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."REGISTRY_BACKPORTS_PK" ON "SYS"."REGISTRY$BACKPORTS" ("BUGNO", "VERSION_FULL") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
