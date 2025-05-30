--------------------------------------------------------
--  DDL for Index EPG$_AUTH_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."EPG$_AUTH_PK" ON "SYS"."EPG$_AUTH" ("DADNAME", "USER#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
