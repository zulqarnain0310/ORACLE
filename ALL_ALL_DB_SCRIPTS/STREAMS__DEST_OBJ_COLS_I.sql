--------------------------------------------------------
--  DDL for Index STREAMS$_DEST_OBJ_COLS_I
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."STREAMS$_DEST_OBJ_COLS_I" ON "SYS"."STREAMS$_DEST_OBJ_COLS" ("OBJECT_NUMBER", "COLUMN_NAME", "DBLINK") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
