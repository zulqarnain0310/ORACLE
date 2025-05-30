--------------------------------------------------------
--  Constraints for Table WRH$_ACTIVE_SESSION_HISTORY
--------------------------------------------------------

  ALTER TABLE "SYS"."WRH$_ACTIVE_SESSION_HISTORY" MODIFY ("SNAP_ID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRH$_ACTIVE_SESSION_HISTORY" MODIFY ("DBID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRH$_ACTIVE_SESSION_HISTORY" MODIFY ("INSTANCE_NUMBER" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRH$_ACTIVE_SESSION_HISTORY" MODIFY ("SAMPLE_ID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRH$_ACTIVE_SESSION_HISTORY" MODIFY ("SAMPLE_TIME" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRH$_ACTIVE_SESSION_HISTORY" MODIFY ("SESSION_ID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRH$_ACTIVE_SESSION_HISTORY" MODIFY ("CON_DBID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRH$_ACTIVE_SESSION_HISTORY" ADD CONSTRAINT "WRH$_ACTIVE_SESSION_HISTORY_PK" PRIMARY KEY ("DBID", "SNAP_ID", "INSTANCE_NUMBER", "SAMPLE_ID", "SESSION_ID", "CON_DBID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX"  LOCAL
 (PARTITION "WRH$_ACTIVE_SESSION_HISTORY_692950692_0" NOCOMPRESS 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" , 
 PARTITION "WRH$_ACTIVE_SES_MXDB_MXSN" NOCOMPRESS 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" )  ENABLE;
