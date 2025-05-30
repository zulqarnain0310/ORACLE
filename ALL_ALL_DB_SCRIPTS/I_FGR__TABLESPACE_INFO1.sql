--------------------------------------------------------
--  DDL for Index I_FGR$_TABLESPACE_INFO1
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_FGR$_TABLESPACE_INFO1" ON "SYS"."FGR$_TABLESPACE_INFO" ("VERSION_GUID", "TABLESPACE_NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
