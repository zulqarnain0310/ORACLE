--------------------------------------------------------
--  DDL for Index REGISTRY_PROGRESS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."REGISTRY_PROGRESS_PK" ON "SYS"."REGISTRY$PROGRESS" ("CID", "NAMESPACE", "ACTION") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
