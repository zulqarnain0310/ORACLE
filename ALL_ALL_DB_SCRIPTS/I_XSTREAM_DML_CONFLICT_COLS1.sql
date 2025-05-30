--------------------------------------------------------
--  DDL for Index I_XSTREAM_DML_CONFLICT_COLS1
--------------------------------------------------------

  CREATE INDEX "SYS"."I_XSTREAM_DML_CONFLICT_COLS1" ON "SYS"."XSTREAM$_DML_CONFLICT_COLUMNS" ("CONFLICT_HANDLER_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
