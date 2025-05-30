--------------------------------------------------------
--  DDL for Index I_XSTREAM_DML_CONF_HANDLER2
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_XSTREAM_DML_CONF_HANDLER2" ON "SYS"."XSTREAM$_DML_CONFLICT_HANDLER" ("APPLY_NAME", "CONFLICT_HANDLER_NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
