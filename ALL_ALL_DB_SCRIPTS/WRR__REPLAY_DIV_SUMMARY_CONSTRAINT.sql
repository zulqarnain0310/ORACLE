--------------------------------------------------------
--  Constraints for Table WRR$_REPLAY_DIV_SUMMARY
--------------------------------------------------------

  ALTER TABLE "SYS"."WRR$_REPLAY_DIV_SUMMARY" MODIFY ("REPLAY_ID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRR$_REPLAY_DIV_SUMMARY" MODIFY ("TYPE" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRR$_REPLAY_DIV_SUMMARY" MODIFY ("FILE_ID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRR$_REPLAY_DIV_SUMMARY" MODIFY ("OCCURRENCES" NOT NULL ENABLE);
