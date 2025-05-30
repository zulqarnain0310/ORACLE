--------------------------------------------------------
--  DDL for Index I_FGR$_FILE_GROUP_VERSIONS3
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_FGR$_FILE_GROUP_VERSIONS3" ON "SYS"."FGR$_FILE_GROUP_VERSIONS" ("VERSION_GUID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
