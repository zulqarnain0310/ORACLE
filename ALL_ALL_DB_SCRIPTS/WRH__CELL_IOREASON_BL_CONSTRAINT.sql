--------------------------------------------------------
--  Constraints for Table WRH$_CELL_IOREASON_BL
--------------------------------------------------------

  ALTER TABLE "SYS"."WRH$_CELL_IOREASON_BL" MODIFY ("SNAP_ID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRH$_CELL_IOREASON_BL" MODIFY ("DBID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRH$_CELL_IOREASON_BL" MODIFY ("CELL_HASH" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRH$_CELL_IOREASON_BL" MODIFY ("INCARNATION_NUM" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRH$_CELL_IOREASON_BL" MODIFY ("CON_DBID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRH$_CELL_IOREASON_BL" MODIFY ("REASON_ID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRH$_CELL_IOREASON_BL" ADD CONSTRAINT "WRH$_CELL_IOREASON_BL_PK" PRIMARY KEY ("DBID", "SNAP_ID", "REASON_ID", "CELL_HASH", "INCARNATION_NUM", "CON_DBID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX"  ENABLE;
