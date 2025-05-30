--------------------------------------------------------
--  DDL for Index I_REDEF_OBJECT_BACKUP$
--------------------------------------------------------

  CREATE INDEX "SYS"."I_REDEF_OBJECT_BACKUP$" ON "SYS"."REDEF_OBJECT_BACKUP$" ("REDEF_ID", "OBJ_TYPE", "OBJ_OWNER", "OBJ_NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
