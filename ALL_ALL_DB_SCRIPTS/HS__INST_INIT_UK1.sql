--------------------------------------------------------
--  DDL for Index HS$_INST_INIT_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."HS$_INST_INIT_UK1" ON "SYS"."HS$_INST_INIT" ("FDS_INST_ID", "INIT_VALUE_NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
