--------------------------------------------------------
--  DDL for Index STREAMS$_COMPONENT_PROP_IND
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."STREAMS$_COMPONENT_PROP_IND" ON "SYS"."STREAMS$_COMPONENT_PROP" ("COMPONENT_ID", "PROP_NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
