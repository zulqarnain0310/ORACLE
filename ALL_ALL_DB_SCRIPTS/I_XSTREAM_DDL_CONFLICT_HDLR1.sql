--------------------------------------------------------
--  DDL for Index I_XSTREAM_DDL_CONFLICT_HDLR1
--------------------------------------------------------

  CREATE INDEX "SYS"."I_XSTREAM_DDL_CONFLICT_HDLR1" ON "SYS"."XSTREAM$_DDL_CONFLICT_HANDLER" ("APPLY_NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
