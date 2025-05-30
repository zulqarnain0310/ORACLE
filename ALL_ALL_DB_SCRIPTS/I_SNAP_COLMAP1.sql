--------------------------------------------------------
--  DDL for Index I_SNAP_COLMAP1
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_SNAP_COLMAP1" ON "SYS"."SNAP_COLMAP$" ("SOWNER", "VNAME", "INSTSITE", "TABNUM", "SNACOL") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
