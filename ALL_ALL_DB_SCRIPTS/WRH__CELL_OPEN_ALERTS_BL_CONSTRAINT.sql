--------------------------------------------------------
--  Constraints for Table WRH$_CELL_OPEN_ALERTS_BL
--------------------------------------------------------

  ALTER TABLE "SYS"."WRH$_CELL_OPEN_ALERTS_BL" MODIFY ("SNAP_ID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRH$_CELL_OPEN_ALERTS_BL" MODIFY ("DBID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRH$_CELL_OPEN_ALERTS_BL" MODIFY ("CELL_HASH" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRH$_CELL_OPEN_ALERTS_BL" MODIFY ("CON_DBID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRH$_CELL_OPEN_ALERTS_BL" MODIFY ("BEGIN_TIME" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRH$_CELL_OPEN_ALERTS_BL" MODIFY ("SEQ_NO" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRH$_CELL_OPEN_ALERTS_BL" ADD CONSTRAINT "WRH$_CELL_OPEN_ALERTS_BL_PK" PRIMARY KEY ("DBID", "SNAP_ID", "BEGIN_TIME", "SEQ_NO", "CELL_HASH", "CON_DBID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX"  ENABLE;
