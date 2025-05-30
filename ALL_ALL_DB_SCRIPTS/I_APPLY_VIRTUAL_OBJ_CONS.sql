--------------------------------------------------------
--  DDL for Index I_APPLY_VIRTUAL_OBJ_CONS
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_APPLY_VIRTUAL_OBJ_CONS" ON "SYS"."APPLY$_VIRTUAL_OBJ_CONS" ("OWNER", "NAME", "POWNER", "PNAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
