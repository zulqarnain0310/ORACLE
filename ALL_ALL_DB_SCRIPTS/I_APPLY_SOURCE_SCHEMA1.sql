--------------------------------------------------------
--  DDL for Index I_APPLY_SOURCE_SCHEMA1
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_APPLY_SOURCE_SCHEMA1" ON "SYS"."APPLY$_SOURCE_SCHEMA" ("SOURCE_DB_NAME", "GLOBAL_FLAG", "NAME", "DBLINK", "SOURCE_ROOT_NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
