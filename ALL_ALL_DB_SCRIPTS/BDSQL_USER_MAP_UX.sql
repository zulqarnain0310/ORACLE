--------------------------------------------------------
--  DDL for Index BDSQL_USER_MAP_UX
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."BDSQL_USER_MAP_UX" ON "SYS"."BDSQL_USER_MAP" ("CLUSTER_NAME", "CURRENT_DATABASE_USER") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
