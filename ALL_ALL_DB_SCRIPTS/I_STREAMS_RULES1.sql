--------------------------------------------------------
--  DDL for Index I_STREAMS_RULES1
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_STREAMS_RULES1" ON "SYS"."STREAMS$_RULES" ("RULE_OWNER", "RULE_NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
