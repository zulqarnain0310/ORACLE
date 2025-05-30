--------------------------------------------------------
--  DDL for Index STREAMS$_DEST_OBJS_I
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."STREAMS$_DEST_OBJS_I" ON "SYS"."STREAMS$_DEST_OBJS" ("OBJECT_NUMBER", "DBLINK") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
