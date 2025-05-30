--------------------------------------------------------
--  DDL for Index I_APPLY_DEST_OBJ_OPS1
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_APPLY_DEST_OBJ_OPS1" ON "SYS"."APPLY$_DEST_OBJ_OPS" ("SNAME", "ONAME", "APPLY_OPERATION", "APPLY_NAME", "HANDLER_NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
