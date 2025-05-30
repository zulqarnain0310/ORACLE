--------------------------------------------------------
--  DDL for Index HS_PARALLEL_METADATA_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."HS_PARALLEL_METADATA_PK" ON "SYS"."HS$_PARALLEL_METADATA" ("DBLINK", "REMOTE_TABLE_NAME", "REMOTE_SCHEMA_NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
