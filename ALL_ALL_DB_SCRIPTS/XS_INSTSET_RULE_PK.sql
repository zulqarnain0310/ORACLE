--------------------------------------------------------
--  DDL for Index XS$INSTSET_RULE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."XS$INSTSET_RULE_PK" ON "SYS"."XS$INSTSET_RULE" ("XDSID#", "ORDER#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
