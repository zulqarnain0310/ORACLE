--------------------------------------------------------
--  DDL for Index I_FGR$_FILE_GROUP_VERSIONS2
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_FGR$_FILE_GROUP_VERSIONS2" ON "SYS"."FGR$_FILE_GROUP_VERSIONS" ("FILE_GROUP_ID", "VERSION_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
