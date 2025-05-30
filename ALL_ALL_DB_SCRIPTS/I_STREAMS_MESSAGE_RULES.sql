--------------------------------------------------------
--  DDL for Index I_STREAMS_MESSAGE_RULES
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_STREAMS_MESSAGE_RULES" ON "SYS"."STREAMS$_MESSAGE_RULES" ("STREAMS_NAME", "STREAMS_TYPE", "RULE_OWNER", "RULE_NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
