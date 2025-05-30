--------------------------------------------------------
--  DDL for Index HS$_CLASS_DD_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."HS$_CLASS_DD_UK1" ON "SYS"."HS$_CLASS_DD" ("FDS_CLASS_ID", "DD_TABLE_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
