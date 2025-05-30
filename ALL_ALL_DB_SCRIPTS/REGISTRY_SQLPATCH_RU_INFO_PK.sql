--------------------------------------------------------
--  DDL for Index REGISTRY$SQLPATCH_RU_INFO_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."REGISTRY$SQLPATCH_RU_INFO_PK" ON "SYS"."REGISTRY$SQLPATCH_RU_INFO" ("PATCH_ID", "PATCH_UID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
