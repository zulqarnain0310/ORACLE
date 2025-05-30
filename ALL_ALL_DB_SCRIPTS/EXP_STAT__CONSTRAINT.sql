--------------------------------------------------------
--  Constraints for Table EXP_STAT$
--------------------------------------------------------

  ALTER TABLE "SYS"."EXP_STAT$" MODIFY ("EXP_ID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."EXP_STAT$" MODIFY ("OBJN" NOT NULL ENABLE);
  ALTER TABLE "SYS"."EXP_STAT$" MODIFY ("EVAL_COUNT" NOT NULL ENABLE);
  ALTER TABLE "SYS"."EXP_STAT$" MODIFY ("SNAPSHOT_ID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."EXP_STAT$" MODIFY ("CTIME" NOT NULL ENABLE);
