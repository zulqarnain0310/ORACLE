--------------------------------------------------------
--  DDL for Index CLI_INST$PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."CLI_INST$PK" ON "SYS"."CLI_INST$" ("GUID", "USER#", "LOG#", "INST#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
