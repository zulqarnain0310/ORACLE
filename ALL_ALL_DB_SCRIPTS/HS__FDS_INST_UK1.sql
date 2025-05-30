--------------------------------------------------------
--  DDL for Index HS$_FDS_INST_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."HS$_FDS_INST_UK1" ON "SYS"."HS$_FDS_INST" ("FDS_INST_NAME", "FDS_CLASS_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
