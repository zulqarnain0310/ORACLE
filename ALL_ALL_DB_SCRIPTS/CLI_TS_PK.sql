--------------------------------------------------------
--  DDL for Index CLI_TS$PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."CLI_TS$PK" ON "SYS"."CLI_TS$" ("GUID", "USER#", "LOG#", "TS#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
