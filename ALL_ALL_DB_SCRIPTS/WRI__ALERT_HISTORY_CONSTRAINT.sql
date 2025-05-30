--------------------------------------------------------
--  Constraints for Table WRI$_ALERT_HISTORY
--------------------------------------------------------

  ALTER TABLE "SYS"."WRI$_ALERT_HISTORY" ADD CONSTRAINT "WRI$_ALERT_HISTORY_PK" PRIMARY KEY ("SEQUENCE_ID", "STATE_TRANSITION_NUMBER")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX"  ENABLE;
