--------------------------------------------------------
--  Constraints for Table WRR$_REPLAY_SQL_MAP
--------------------------------------------------------

  ALTER TABLE "SYS"."WRR$_REPLAY_SQL_MAP" ADD CONSTRAINT "WRR$_REPLAY_SQL_MAP_PK" PRIMARY KEY ("REPLAY_ID", "SCHEDULE_CAP_ID", "SQL_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX"  ENABLE;
