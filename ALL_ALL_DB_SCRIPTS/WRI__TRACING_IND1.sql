--------------------------------------------------------
--  DDL for Index WRI$_TRACING_IND1
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRI$_TRACING_IND1" ON "SYS"."WRI$_TRACING_ENABLED" ("TRACE_TYPE", "PRIMARY_ID", "QUALIFIER_ID1", "QUALIFIER_ID2", "INSTANCE_NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
