--------------------------------------------------------
--  DDL for Index WRR$_WORKLOAD_ATTRIBUTES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRR$_WORKLOAD_ATTRIBUTES_PK" ON "SYS"."WRR$_WORKLOAD_ATTRIBUTES" ("CAPTURE_ID", "REPLAY_ID", "NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ;
