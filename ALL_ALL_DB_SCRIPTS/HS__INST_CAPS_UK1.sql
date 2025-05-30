--------------------------------------------------------
--  DDL for Index HS$_INST_CAPS_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."HS$_INST_CAPS_UK1" ON "SYS"."HS$_INST_CAPS" ("FDS_INST_ID", "CAP_NUMBER") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
