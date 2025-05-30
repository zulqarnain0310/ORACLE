--------------------------------------------------------
--  Constraints for Table WRH$_CELL_IOREASON
--------------------------------------------------------

  ALTER TABLE "SYS"."WRH$_CELL_IOREASON" MODIFY ("SNAP_ID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRH$_CELL_IOREASON" MODIFY ("DBID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRH$_CELL_IOREASON" MODIFY ("CELL_HASH" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRH$_CELL_IOREASON" MODIFY ("INCARNATION_NUM" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRH$_CELL_IOREASON" MODIFY ("CON_DBID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRH$_CELL_IOREASON" MODIFY ("REASON_ID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRH$_CELL_IOREASON" ADD CONSTRAINT "WRH$_CELL_IOREASON_PK" PRIMARY KEY ("DBID", "SNAP_ID", "REASON_ID", "CELL_HASH", "INCARNATION_NUM", "CON_DBID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX"  LOCAL
 (PARTITION "WRH$_CELL_IOREASON_692950692_0" NOCOMPRESS 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" , 
 PARTITION "WRH$_CELL_IOREASON_MXDB_MXSN" NOCOMPRESS 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" )  ENABLE;
