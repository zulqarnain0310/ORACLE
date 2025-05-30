--------------------------------------------------------
--  DDL for Index I_MON_MODS$_OBJ
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_MON_MODS$_OBJ" ON "SYS"."MON_MODS$" ("OBJ#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE( MAXEXTENTS 2147483645)
  TABLESPACE "SYSTEM" ;
