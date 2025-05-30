--------------------------------------------------------
--  Constraints for Table WRH$_SYS_TIME_MODEL_BL
--------------------------------------------------------

  ALTER TABLE "SYS"."WRH$_SYS_TIME_MODEL_BL" MODIFY ("SNAP_ID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRH$_SYS_TIME_MODEL_BL" MODIFY ("DBID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRH$_SYS_TIME_MODEL_BL" MODIFY ("INSTANCE_NUMBER" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRH$_SYS_TIME_MODEL_BL" MODIFY ("STAT_ID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRH$_SYS_TIME_MODEL_BL" MODIFY ("CON_DBID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRH$_SYS_TIME_MODEL_BL" ADD CONSTRAINT "WRH$_SYS_TIME_MODEL_BL_PK" PRIMARY KEY ("DBID", "SNAP_ID", "INSTANCE_NUMBER", "STAT_ID", "CON_DBID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX"  ENABLE;
