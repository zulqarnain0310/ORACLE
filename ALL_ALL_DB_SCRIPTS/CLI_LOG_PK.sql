--------------------------------------------------------
--  DDL for Index CLI_LOG$PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."CLI_LOG$PK" ON "SYS"."CLI_LOG$" ("GUID", "USER#", "NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
