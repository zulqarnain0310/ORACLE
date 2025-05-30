--------------------------------------------------------
--  Constraints for Table MVREF$_RUN_STATS
--------------------------------------------------------

  ALTER TABLE "SYS"."MVREF$_RUN_STATS" MODIFY ("RUN_OWNER_USER#" NOT NULL ENABLE);
  ALTER TABLE "SYS"."MVREF$_RUN_STATS" MODIFY ("REFRESH_ID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."MVREF$_RUN_STATS" MODIFY ("NUM_MVS_TOTAL" NOT NULL ENABLE);
  ALTER TABLE "SYS"."MVREF$_RUN_STATS" MODIFY ("NUM_MVS_CURRENT" NOT NULL ENABLE);
