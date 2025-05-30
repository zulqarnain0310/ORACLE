--------------------------------------------------------
--  DDL for Index HS$_CLASS_CAPS_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."HS$_CLASS_CAPS_UK1" ON "SYS"."HS$_CLASS_CAPS" ("FDS_CLASS_ID", "CAP_NUMBER") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
