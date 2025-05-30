--------------------------------------------------------
--  DDL for Index REGISTRY$SQLPATCH_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."REGISTRY$SQLPATCH_PK" ON "SYS"."REGISTRY$SQLPATCH" ("INSTALL_ID", "PATCH_ID", "PATCH_UID", "ACTION", "ACTION_TIME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
