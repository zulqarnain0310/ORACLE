--------------------------------------------------------
--  DDL for Index I_REPL_DBNAME_MAPPING_1
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_REPL_DBNAME_MAPPING_1" ON "SYS"."REPL$_DBNAME_MAPPING" ("SOURCE_ROOT_NAME", "SOURCE_DATABASE_NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
