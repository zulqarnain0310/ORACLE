--------------------------------------------------------
--  DDL for Index WRH$_SYS_TIME_MODEL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRH$_SYS_TIME_MODEL_PK" ON "SYS"."WRH$_SYS_TIME_MODEL" ("DBID", "SNAP_ID", "INSTANCE_NUMBER", "STAT_ID", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX"  LOCAL
 (PARTITION "WRH$_SYS_TIME_MODEL_692950692_0" NOCOMPRESS 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" , 
 PARTITION "WRH$_SYS_TIME_MO_MXDB_MXSN" NOCOMPRESS 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ) ;
