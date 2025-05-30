--------------------------------------------------------
--  DDL for Index SCHEDULER$_FW_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."SCHEDULER$_FW_PK" ON "SYS"."SCHEDULER$_FILE_WATCHER" ("OBJ#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
