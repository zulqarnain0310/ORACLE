--------------------------------------------------------
--  DDL for Index I_APPLY_DEST_OBJ3
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_APPLY_DEST_OBJ3" ON "SYS"."APPLY$_DEST_OBJ" ("OWNER", "NAME", "TYPE", "APPLY#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
