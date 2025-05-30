--------------------------------------------------------
--  Constraints for Table WRM$_WR_USAGE
--------------------------------------------------------

  ALTER TABLE "SYS"."WRM$_WR_USAGE" MODIFY ("FEATURE_TYPE" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRM$_WR_USAGE" MODIFY ("FEATURE_NAME" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRM$_WR_USAGE" MODIFY ("USAGE_TIME" NOT NULL ENABLE);
