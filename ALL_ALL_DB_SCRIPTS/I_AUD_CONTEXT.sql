--------------------------------------------------------
--  DDL for Index I_AUD_CONTEXT
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_AUD_CONTEXT" ON "SYS"."AUD_CONTEXT$" ("NAMESPACE", "ATTRIBUTE", "USER#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
