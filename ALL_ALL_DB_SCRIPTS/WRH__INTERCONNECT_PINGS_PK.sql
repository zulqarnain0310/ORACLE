--------------------------------------------------------
--  DDL for Index WRH$_INTERCONNECT_PINGS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRH$_INTERCONNECT_PINGS_PK" ON "SYS"."WRH$_INTERCONNECT_PINGS" ("DBID", "SNAP_ID", "INSTANCE_NUMBER", "TARGET_INSTANCE", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX"  LOCAL
 (PARTITION "WRH$_INTERCONNECT_PINGS_692950692_0" NOCOMPRESS 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" , 
 PARTITION "WRH$_IC_PINGS_MXDB_MXSN" NOCOMPRESS 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ) ;
