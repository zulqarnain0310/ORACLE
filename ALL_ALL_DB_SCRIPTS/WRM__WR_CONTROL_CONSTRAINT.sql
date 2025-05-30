--------------------------------------------------------
--  Constraints for Table WRM$_WR_CONTROL
--------------------------------------------------------

  ALTER TABLE "SYS"."WRM$_WR_CONTROL" MODIFY ("DBID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRM$_WR_CONTROL" MODIFY ("SNAP_INTERVAL" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRM$_WR_CONTROL" MODIFY ("RETENTION" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRM$_WR_CONTROL" MODIFY ("MOST_RECENT_SNAP_ID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRM$_WR_CONTROL" ADD CONSTRAINT "WRM$_WR_CONTROL_PK" PRIMARY KEY ("DBID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX"  ENABLE;
