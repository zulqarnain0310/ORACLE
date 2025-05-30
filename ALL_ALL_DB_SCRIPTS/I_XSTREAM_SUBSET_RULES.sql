--------------------------------------------------------
--  DDL for Index I_XSTREAM_SUBSET_RULES
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_XSTREAM_SUBSET_RULES" ON "SYS"."XSTREAM$_SUBSET_RULES" ("SERVER_NAME", "RULES_OWNER", "INSERT_RULE", "DELETE_RULE", "UPDATE_RULE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
