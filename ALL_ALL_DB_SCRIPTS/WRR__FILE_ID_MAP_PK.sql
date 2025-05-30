--------------------------------------------------------
--  DDL for Index WRR$_FILE_ID_MAP_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRR$_FILE_ID_MAP_PK" ON "SYS"."WRR$_FILE_ID_MAP" ("CAP_FILE_ID", "SCHEDULE_CAP_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
