--------------------------------------------------------
--  DDL for Index I_REDEF_DEP_ERROR$
--------------------------------------------------------

  CREATE INDEX "SYS"."I_REDEF_DEP_ERROR$" ON "SYS"."REDEF_DEP_ERROR$" ("REDEF_ID", "OBJ_TYPE", "OBJ_OWNER", "OBJ_NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
