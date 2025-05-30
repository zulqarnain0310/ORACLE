--------------------------------------------------------
--  DDL for Index I_SNAP_OBJCOL1
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_SNAP_OBJCOL1" ON "SYS"."SNAP_OBJCOL$" ("SOWNER", "VNAME", "INSTSITE", "TABNUM", "SNACOL") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
