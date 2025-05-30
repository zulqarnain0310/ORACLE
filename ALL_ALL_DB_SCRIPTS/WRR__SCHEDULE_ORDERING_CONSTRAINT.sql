--------------------------------------------------------
--  Constraints for Table WRR$_SCHEDULE_ORDERING
--------------------------------------------------------

  ALTER TABLE "SYS"."WRR$_SCHEDULE_ORDERING" MODIFY ("SCHEDULE_NAME" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRR$_SCHEDULE_ORDERING" MODIFY ("SCHEDULE_CAP_ID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRR$_SCHEDULE_ORDERING" MODIFY ("WAITFOR_CAP_ID" NOT NULL ENABLE);
