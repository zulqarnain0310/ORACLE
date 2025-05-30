--------------------------------------------------------
--  DDL for Index I_FGR$_FILE_GROUP_VERSIONS1
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_FGR$_FILE_GROUP_VERSIONS1" ON "SYS"."FGR$_FILE_GROUP_VERSIONS" ("VERSION_NAME", "FILE_GROUP_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
