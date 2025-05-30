--------------------------------------------------------
--  DDL for Index I_FED_BINDS$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_FED_BINDS$" ON "SYS"."FED$BINDS" ("APPID#", "SEQ#", "INC#", "BIND#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
