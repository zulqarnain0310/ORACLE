--------------------------------------------------------
--  Constraints for Table MV_REFRESH_USAGE_STATS$
--------------------------------------------------------

  ALTER TABLE "SYS"."MV_REFRESH_USAGE_STATS$" MODIFY ("MV_TYPE#" NOT NULL ENABLE);
  ALTER TABLE "SYS"."MV_REFRESH_USAGE_STATS$" MODIFY ("REFRESH_METHOD#" NOT NULL ENABLE);
  ALTER TABLE "SYS"."MV_REFRESH_USAGE_STATS$" MODIFY ("REFRESH_MODE#" NOT NULL ENABLE);
  ALTER TABLE "SYS"."MV_REFRESH_USAGE_STATS$" MODIFY ("OUT_OF_PLACE#" NOT NULL ENABLE);
  ALTER TABLE "SYS"."MV_REFRESH_USAGE_STATS$" MODIFY ("ATOMIC#" NOT NULL ENABLE);
  ALTER TABLE "SYS"."MV_REFRESH_USAGE_STATS$" MODIFY ("COUNT#" NOT NULL ENABLE);
  ALTER TABLE "SYS"."MV_REFRESH_USAGE_STATS$" MODIFY ("SEQ#" NOT NULL ENABLE);
