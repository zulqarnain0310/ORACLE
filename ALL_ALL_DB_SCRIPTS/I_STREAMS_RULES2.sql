--------------------------------------------------------
--  DDL for Index I_STREAMS_RULES2
--------------------------------------------------------

  CREATE INDEX "SYS"."I_STREAMS_RULES2" ON "SYS"."STREAMS$_RULES" ("SCHEMA_NAME", "OBJECT_NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
