--------------------------------------------------------
--  DDL for Index I_FGR$_TABLE_INFO2
--------------------------------------------------------

  CREATE INDEX "SYS"."I_FGR$_TABLE_INFO2" ON "SYS"."FGR$_TABLE_INFO" ("SCHEMA_NAME", "TABLE_NAME", "TABLESPACE_NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
