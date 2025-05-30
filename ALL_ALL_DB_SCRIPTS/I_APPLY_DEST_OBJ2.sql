--------------------------------------------------------
--  DDL for Index I_APPLY_DEST_OBJ2
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_APPLY_DEST_OBJ2" ON "SYS"."APPLY$_DEST_OBJ" ("SOURCE_OWNER", "SOURCE_NAME", "TYPE", "APPLY#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
