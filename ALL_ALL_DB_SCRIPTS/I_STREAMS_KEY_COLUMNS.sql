--------------------------------------------------------
--  DDL for Index I_STREAMS_KEY_COLUMNS
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_STREAMS_KEY_COLUMNS" ON "SYS"."STREAMS$_KEY_COLUMNS" ("SNAME", "ONAME", "TYPE", "APPLY_NAME", "CNAME", "DBLINK") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
