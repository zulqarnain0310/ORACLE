--------------------------------------------------------
--  Constraints for Table WRH$_OSSTAT
--------------------------------------------------------

  ALTER TABLE "SYS"."WRH$_OSSTAT" MODIFY ("SNAP_ID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRH$_OSSTAT" MODIFY ("DBID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRH$_OSSTAT" MODIFY ("INSTANCE_NUMBER" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRH$_OSSTAT" MODIFY ("STAT_ID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRH$_OSSTAT" MODIFY ("CON_DBID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRH$_OSSTAT" ADD CONSTRAINT "WRH$_OSSTAT_PK" PRIMARY KEY ("DBID", "SNAP_ID", "INSTANCE_NUMBER", "STAT_ID", "CON_DBID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX"  LOCAL
 (PARTITION "WRH$_OSSTAT_692950692_0" NOCOMPRESS 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" , 
 PARTITION "WRH$_OSSTAT_MXDB_MXSN" NOCOMPRESS 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" )  ENABLE;
