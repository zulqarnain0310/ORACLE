--------------------------------------------------------
--  DDL for Index SCHEDULER$_SRCQ_MAP_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."SCHEDULER$_SRCQ_MAP_PK" ON "SYS"."SCHEDULER$_SRCQ_MAP" ("OID", "RULE_NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
