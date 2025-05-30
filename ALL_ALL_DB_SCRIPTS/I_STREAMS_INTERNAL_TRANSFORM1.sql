--------------------------------------------------------
--  DDL for Index I_STREAMS_INTERNAL_TRANSFORM1
--------------------------------------------------------

  CREATE INDEX "SYS"."I_STREAMS_INTERNAL_TRANSFORM1" ON "SYS"."STREAMS$_INTERNAL_TRANSFORM" ("RULE_OWNER", "RULE_NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
