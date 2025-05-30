--------------------------------------------------------
--  DDL for Index I_FGR$_TABLE_INFO1
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_FGR$_TABLE_INFO1" ON "SYS"."FGR$_TABLE_INFO" ("VERSION_GUID", "SCHEMA_NAME", "TABLE_NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
