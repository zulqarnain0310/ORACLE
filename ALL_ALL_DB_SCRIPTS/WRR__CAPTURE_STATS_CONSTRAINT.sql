--------------------------------------------------------
--  Constraints for Table WRR$_CAPTURE_STATS
--------------------------------------------------------

  ALTER TABLE "SYS"."WRR$_CAPTURE_STATS" ADD CONSTRAINT "WRR$_CAPTURE_STATS_PK" PRIMARY KEY ("ID", "INSTANCE_NUMBER", "STARTUP_TIME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX"  ENABLE;
