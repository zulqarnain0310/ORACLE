--------------------------------------------------------
--  DDL for Index WRR$_REPLAY_REMAPPING_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRR$_REPLAY_REMAPPING_PK" ON "SYS"."WRR$_REPLAY_COMMIT_REMAPPING" ("FILE_ID", "COMMIT_SCN") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS NOLOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ;
