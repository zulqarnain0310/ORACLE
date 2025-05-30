--------------------------------------------------------
--  DDL for Index CLI_PART$PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."CLI_PART$PK" ON "SYS"."CLI_PART$" ("GUID", "USER#", "LOG#", "TAB#", "PART#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
