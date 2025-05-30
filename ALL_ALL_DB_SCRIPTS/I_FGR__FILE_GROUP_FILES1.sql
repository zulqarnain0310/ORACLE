--------------------------------------------------------
--  DDL for Index I_FGR$_FILE_GROUP_FILES1
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_FGR$_FILE_GROUP_FILES1" ON "SYS"."FGR$_FILE_GROUP_FILES" ("FILE_NAME", "VERSION_GUID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
