--------------------------------------------------------
--  Constraints for Table WRR$_REPLAY_STATS
--------------------------------------------------------

  ALTER TABLE "SYS"."WRR$_REPLAY_STATS" ADD CONSTRAINT "WRR$_REPLAY_STATS_PK" PRIMARY KEY ("ID", "INSTANCE_NUMBER", "STARTUP_TIME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX"  ENABLE;
