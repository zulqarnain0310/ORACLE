--------------------------------------------------------
--  DDL for Index CLI_TAB$PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."CLI_TAB$PK" ON "SYS"."CLI_TAB$" ("GUID", "USER#", "LOG#", "TAB#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
