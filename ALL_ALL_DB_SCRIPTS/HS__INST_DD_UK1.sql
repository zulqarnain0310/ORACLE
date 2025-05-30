--------------------------------------------------------
--  DDL for Index HS$_INST_DD_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."HS$_INST_DD_UK1" ON "SYS"."HS$_INST_DD" ("FDS_INST_ID", "DD_TABLE_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
