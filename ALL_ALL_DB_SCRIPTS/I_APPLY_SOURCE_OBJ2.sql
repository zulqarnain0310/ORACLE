--------------------------------------------------------
--  DDL for Index I_APPLY_SOURCE_OBJ2
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_APPLY_SOURCE_OBJ2" ON "SYS"."APPLY$_SOURCE_OBJ" ("OWNER", "NAME", "TYPE", "SOURCE_DB_NAME", "DBLINK", "SOURCE_ROOT_NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
