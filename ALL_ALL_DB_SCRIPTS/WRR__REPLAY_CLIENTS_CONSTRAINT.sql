--------------------------------------------------------
--  Constraints for Table WRR$_REPLAY_CLIENTS
--------------------------------------------------------

  ALTER TABLE "SYS"."WRR$_REPLAY_CLIENTS" MODIFY ("WRC_ID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRR$_REPLAY_CLIENTS" MODIFY ("SCHEDULE_CAP_ID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRR$_REPLAY_CLIENTS" MODIFY ("INST_ID" NOT NULL ENABLE);
