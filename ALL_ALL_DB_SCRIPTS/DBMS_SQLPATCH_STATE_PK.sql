--------------------------------------------------------
--  DDL for Index DBMS_SQLPATCH_STATE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."DBMS_SQLPATCH_STATE_PK" ON "SYS"."DBMS_SQLPATCH_STATE" ("S_CURRENT_PATCH_ID", "S_CURRENT_PATCH_UID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
